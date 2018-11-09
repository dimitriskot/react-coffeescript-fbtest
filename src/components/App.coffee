import React from "react"

class App extends React.Component
	constructor: (@props) ->
		superArg = -> @props
		super superArg

	render: ->
		return(
			<h1>{@props.title}</h1>
		)

export default App;
