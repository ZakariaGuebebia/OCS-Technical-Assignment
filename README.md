# About OCS App 🍊🍿🎬

Hello there, In this project I tried showcasing how to build an iOS Application with clean architecture and MVVM-C using Combine and UIkit. This App is using the OCS API as a remote data source.

The Thing that triggered me the most, is to make this app compatible with tvOS, since it's my first time exploring iOS developement from tvOS perspective.

This side project was delivered in the context of one-week assignment.

I'm a big fan of Clean architecture, as it's modular and easily extendable, a while ago I was experimenting with it and made this [presentation](https://drive.google.com/file/d/1E4D63eeJg9rzZQNvLWH9ECSYU6wbxkJM/) to brainstorm with my colleagues at work about it. feel free to check it out.

In this App you will mainly find:

* Three configuration environnement (MOCK, DEV and STAGE)
* Combine
* UIKit
* UnitTest/UITest
* Storyboards
* Localisation
* iPhone, iPad and tvOS Compatibility
* Dark Mode Support

# Screenshots 📷
<p align="center">
  <img src="https://github.com/ZakariaGuebebia/OCS-Technical-Assignment/blob/develop/OCS/Ressources/Screenshots/Simulator%20Screen%20Shot%20-%20iPod%20touch%20(7th%20generation).png" width="100">
  <img src="https://github.com/ZakariaGuebebia/OCS-Technical-Assignment/blob/develop/OCS/Ressources/Screenshots/Simulator%20Screen%20Shot%20-%20iPad%20Pro%20(9.7-inch).png" width="200">
    <img src="https://github.com/ZakariaGuebebia/OCS-Technical-Assignment/blob/develop/OCS/Ressources/Screenshots/Simulator%20Screen%20Shot%20-%20iPod%20touch%20(7th%20generation)%20-%20search.png" width="100">
        <img src="https://github.com/ZakariaGuebebia/OCS-Technical-Assignment/blob/develop/OCS/Ressources/Screenshots/Simulator%20Screen%20Shot%20-%20Apple%20TV%204K.png" width="400">
   
</p>

# Project Architecture👷‍♀️👷‍♂️
### Communication between layers
1. UI calls method from ViewModel.
2. ViewModel executes Use case.
3. Use case executes one or multiple Repositorie function.
4. The Repository returns data from one or multiple Data Sources. the repository is the single source of truth
5. Information flows back to the UI where we display the data fetched from data sources.

I made a diagram to show the flow of the data between the three layers(data, domain , presentation)
![data flow diagram](https://github.com/ZakariaGuebebia/OCS-Technical-Assignment/blob/develop/OCS/Ressources/Screenshots/dataFlowDiagram.png)

# To be added ➕
* more testing

<br/>

## issues 🚩
* base url for images is unkown
