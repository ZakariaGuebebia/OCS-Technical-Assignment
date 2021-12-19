# About OCS App 🍊🍿🎬
Hello there ,
In this project I tried showcasing how to build an iOS Application with clean architecture and MVVM-C using Combine and UIkit. This App is using the [OCS API](https://api.ocs.fr/) as a remote data source.

This side Project was dilleverd in the context of one week assignement.

I'am a big fan of Clean architecture, as it's modular and easily extandable,
a while ago i was exprementing with it and made this [presentation](https://drive.google.com/file/d/1E4D63eeJg9rzZQNvLWH9ECSYU6wbxkJM/) to brainstorm with my colleages at work about it. feel free to check it out.

# Screenshots 📷

# Project Architecture👷‍♀️👷‍♂️
### Communication between layers
1. UI calls method from ViewModel.
2. ViewModel executes Use case.
3. Use case executes one or multiple Repositorie function.
4. The Repository returns data from one or multiple Data Sources. the repository is the single source of truth
5. Information flows back to the UI where we display the data fetched from data sources.

I made a diagram to show the flow of the data between the three layers(data, domain , presentation)
![data flow diagram](screenshots/dataFlowDiagram.png )

# To be added ➕
* more testing

<br />

## issues 🚩
* base url for images is unkown
