What is albalarma?

it's a flutter app that wakes you up at sunrise. \
It's a tool I built to have a lifestyle more according to nature instead of \
our corporate overlords. I used it to learn flutter and \
since its quality is somewhat doubtful but still good enough to be useful to myself, \
it's not in any store so for any reason you would like to use it, \ 
it has to be built and sideloaded.


how it works:

It detects your current location, fetches from the internet the time of the next sunrise and sets an alarm accordingly \
As for the alarm, I decided to use local radio stations to either start the day with good music or updated on the news.\ 
It also gives inspiring quotes periodically for.... inspiration \
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

