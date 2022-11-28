# ariculture

## Member of group
1. 2106657292 - Moza Adirafi Satria Jaka
2. 2106656522 - Muhammad Ghazian Gunawan  
3. 2106720973 - Nicolas Ananda 
4. 2106657815 - Raizaz Achmad Asyraf
5. 2106720891 - Jovian Marvin Chrisniady
6. 2106720866 - David Christianto


## Brief Description of the App
Our group chose the theme of agriculture, we plan to make a mobile app that helps farmers in cultivating land and helps to market it. First, each farmer needs to create an account, then the web asks for the category of that farmer (fruit farmer/vegetable farmer/palm oil farmer). after that, farmers enter the area of the land that they own (in hectares or m^2). After that, farmers enter the location of their land (in mountainous areas / valleys / etc.) so that the mobile app can help choose the right fertilizer for their plants. The mobile app will also assist farmers in providing the fertilizer dose for land per m^2 and the appropriate amount of water. After that, farmers are asked to enter their harvest (success/fail). If successful, farmers are asked to enter the amount of their harvest in tons/kilo so that the mobile app can help farmers advertise and market their crops. The purpose of making this mobile app is to help improve the standard of living of farmers in the modern era in an effective way so that they can advance the agricultural sector in Indonesia as a tropical country with abundant resources, especially fertile soil.

## Link to the releaseable app on GitHub Releases/Firebase App Distribution/Microsoft Visual Studio App Center
[Link to the github repository](https://github.com/DavidChristianto/group2_final_project/releases/tag/m.1)

## List of Modules
1. Homepage (NA)
2. Account Registration and Farmland registration (Raizaz)
3. Farmland info (for obtaining Fertilizer type, Fertilizer dose, and etc. (Jovian)
4. News regarding agriculture (Moza)
5. Advertisements about the farmer's farm land. (Ghazian)
6. Reviews and rating regarding the farmers.(David)

## Integration flow with the web service/web app that previously created in the midterm group project
The integration of the web service/webapp that is previously created in the midterm group project with the final group project is that we perform a HTTP request to retrieve the JSON data from the midterm web app and then process the data to become flutter object using the necessary function in the model page.

## Instructions on how to build, run, and deploy the app
To initialzie the app, First we need to use the command:
```
flutter create Ariculture
```
After creating the app, we change the directory path to the created app using: 
```
cd Ariculture
```

After we change the directory, we can run the project using:
```
flutter run
```

To deploy the app to the App development platform we can use railway with the following steps:

1. Open Railway.app and click the `new project`
2. Choose the `Deploy from GitHub Repo` options
3. Click the `Login with Github` button 
4. After that it will be redirected back to the project creation page, there you need to click the `Deploy GitHub Repo` and click `Configure GitHub App`
5. Choose your group organization and click `Install & Authorize`
6. After that you will be redirected back to the project creation page and then click `Deploy from GitHub repo` and chose the midterm project repository
7. Click `Deploy New`

## Link to Railway 
https://group2midtermproject-production.up.railway.app/



