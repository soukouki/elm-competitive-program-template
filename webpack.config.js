const path = require('path')

module.exports = {
  entry: {
    main: path.join(__dirname, 'src', 'main.js'),
  },

  target: 'node',

  output: {
    path: path.join(__dirname, 'dist'),
    filename: 'main.js',
  },

  module: {
    rules: [
      {
        test: /\.elm$/,
        exclude: [
         /elm-stuff/,
         /node_modules/,
        ],
        use: {
          loader: 'elm-webpack-loader',
          options: {},
        },
      },
    ],
  }
}