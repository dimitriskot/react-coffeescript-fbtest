import React from "react"
import ReactDOM from "react-dom"
import "./scss/style.scss"
import App from "./components/App"

title = "My Minimal React Webpack CoffeeScript Setup"
ROOT = document.getElementById "root"

ReactDOM.render <App title={title} />, ROOT
