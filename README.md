# Albalarma  - Sunrise Alarm
Nature and palta (avocado) inspired alarm clock \
It detects your current location, fetches from the internet the time of the next sunrise and sets an alarm accordingly \
Also its a good boilerplate for new projects since its designed around DDD concepts \
\
Some of the dependencies it uses: 
- Dio -> http requests and great music 🤘
- Flutter Bloc  -> state management
- getIt/Injectable -> dependency injection
- Hive + SharedPreferences -> Local data storage 
- just_audio + audio_session + audio_service -> sound stuff 
- flutter_local_notifications + android_alarm_manager_plus -> alarm stuff 
- geolocation + geocoding -> location stuff 
- freezed + autorouter -> generate cool stuff and save time and code
- lots of love


\
For the correct operation of the app, you have to ensure that android doesnt kill or put it to doze. \
That works different on every vendor but here is a good place to start https://dontkillmyapp.com/

