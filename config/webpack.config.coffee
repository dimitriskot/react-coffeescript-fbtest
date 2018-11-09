path = require("path")
MiniCssExtractPlugin = require("mini-css-extract-plugin")
HtmlWebpackPlugin = require("html-webpack-plugin")
CleanWebpackPlugin = require("clean-webpack-plugin")

isProduction = process.env.NODE_ENV == "production"
mode = if isProduction then "production" else "development"

console.log(process.env.NODE_ENV)
console.log(isProduction)

config =
	mode: mode
	entry: "./src/index.coffee"
	output:
		path: path.resolve("dist")
		filename: "main.[chunkhash:6].js"
	resolve:
		extensions: ["*", ".coffee", ".js"]
	devtool: if isProduction then "source-map" else "cheap-module-eval-source-map"
	module:
		rules: [{
				test: /\.coffee$/
				exclude: /node_modules/
				use: ["coffee-loader", "cjsx-loader"]
			}
			{
				test: /\.scss$/
				use: [
					"style-loader",
					MiniCssExtractPlugin.loader,
					"css-loader",
					"sass-loader"
				]
			}
		]
	plugins: [
		new CleanWebpackPlugin("dist", {})
		new MiniCssExtractPlugin({
			filename: "style.[contenthash:6].css"
		})
		new HtmlWebpackPlugin({
			inject: false,
			hash: true,
			template: "./src/index.html",
			filename: "index.html",
			minify:
				collapseWhitespace: true
				removeComments: true
				removeRedundantAttributes: true
				removeScriptTypeAttributes: true
				removeStyleLinkTypeAttributes: true
				useShortDoctype: true
		})
	]


module.exports = config