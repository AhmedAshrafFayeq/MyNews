//
//  README.md
//  MyNews
//
//  Created by Ahmed Fayeq on 02/01/2022.
//
# MyNews App Documentaion

* SearchViewController
  - Generic Reusable SearchViewController to be used in many apps that require search of item in a list
  
* MVVM-C
  - MVVM pattern was used to observe the changes of the retrieved list of news to update the search view
  - Coordinator was applied to take the navigation part out of the view controller
  
* State
  - State pattern was applied in SearchViewController to handle the different states of the result controller that manage showing the news depending on search or fetching from api 
  
  * Languages
  - Localization was used to handle phone's language if (Arabic or English)
  
