<script>
import { onMount } from 'svelte'
import DailyIframe from '@daily-co/daily-js'


onMount(async () => {
  
  console.log("conf of co");
  
const coConf = {
  callObject: null,
  participants: null,
  count: 0,
  messages: [],
  error: false,
  loading: false,
  showPermissionsError: false,
  screen: null,
  roomUrl: "https://api-demo.daily.co/V3SFUw4EMK08W5UkKWcx",
  name: "foobar"
};

const option = { url: coConf.roomUrl };

// Create instance of Daily call object
const co = DailyIframe.createCallObject(option);

// Join the call with the name set in the Home.vue form
co.join({ userName: coConf.name });

// Add call and participant event handler
// Visit https://docs.daily.co/reference/daily-js/events for more event info
co.on("joining-meeting", coConf.handleJoiningMeeting)
  .on("joined-meeting", coConf.updateParticpants)
  .on("participant-joined", coConf.updateParticpants)
  .on("participant-updated", coConf.updateParticpants)
  .on("participant-left", coConf.updateParticpants)
  .on("error", coConf.handleError)
  // camera-error = device permissions issue
  .on("camera-error", coConf.handleDeviceError)
  // app-message handles receiving remote chat messages
  .on("app-message", coConf.updateMessages);

  let callObject = DailyIframe.createFrame();
  const stream = await navigator.mediaDevices.getUserMedia({ audio: true })
  let recorder = new MediaRecorder(stream)
  recorder.start()

console.log(co)
})

</script>

<h1>Welcome to SvelteKit</h1>
<p>Visit <a href="https://kit.svelte.dev">kit.svelte.dev</a> to read the documentation</p>
