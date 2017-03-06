const webpack = require('webpack');
const pkg = require('../package.json');
const path = require('path');
const isProduction = process.env.NODE_ENV === 'production';
const port = parseInt(process.env.PORT, 10);

const SWPrecacheWebpackPlugin = require('sw-precache-webpack-plugin');
const ExtractTextPlugin = require('extract-text-webpack-plugin')
const extractLESS = new ExtractTextPlugin('less/main.less');

const webpackConfig = {
  entry: {
    'app.js': './defaults/app'

  },
  output: {
    path: path.join(__dirname, '..', '/www'),
    filename: '[name]',
    publicPath: '/js/'
  },
  module: {
    
    rules: [
    { 
        enforce: 'pre',
        test: /\.tag$/, 
        exclude: /node_modules/, 
        loader: 'riotjs-loader', 
        query: { type: 'none' } 
      },
      {
        test: /\.js$|\.tag$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
        query: { 
          plugins: ['lodash'],
          presets: ['es2015']
        }
      },
      {
        test: /\.less$/,      
        loaders: ['style-loader', 'css-loader', 'less-loader']
      },
      {
            test: /\.scss$/,
            loaders: ["style-loader", "css-loader", "sass-loader"]
        },
      { test: /\.(png|woff|woff2|eot|ttf|svg)$/, loader: 'url-loader?limit=100000' }
    ].concat(isProduction ? [{test: /\.js$|\.tag$/, loader: 'strip-loader?strip[]=console.log'}] : [])
  },
  
  plugins: [
    new webpack.ProvidePlugin({
      riot: 'riot'
    }), 
    extractLESS,
    new webpack.ContextReplacementPlugin(/moment[\/\\]locale$/, /en|nb/),
    new SWPrecacheWebpackPlugin(
      {
        cacheId: 'proto-worker',
        filename: 'proto-service-worker.js',
        maximumFileSizeToCacheInBytes: 4194304,
        minify: true,
        runtimeCaching: [{
          handler: 'cacheFirst',
          urlPattern: /[.]mp3$/,
        }],
      }
    )
  ].concat(
    isProduction
    ? [ new webpack.optimize.UglifyJsPlugin({ compress: { warnings: false } })]
    : []),
  devServer: {
    contentBase: './public',
    proxy: {
      '*': 'http://localhost:' + port
    },
    publicPath: '/app/',
    stats: { colors: true },
    port: port + 1
  },
  devtool: process.env.NODE_ENV === 'production' ? 'source-map' : 'eval'
};

module.exports = webpackConfig;