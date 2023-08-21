<script lang="ts">
  import svelteLogo from './assets/svelte.svg'
  import viteLogo from '/vite.svg'
  import Counter from './lib/Counter.svelte'
  import CMMB_Embed from './assets/CMMB_Embed.png'

  var microBitBle;
  let msg

  async function connect() {
    microBitBle = await microBitBleFactory.connect();
    msg.innerHTML = "micro:bit BLE接続しました。";
  }

  async function disconnect() {
    await microBitBle.disconnect();
    msg.innerHTML = "micro:bit BLE接続を切断しました。";
  }

  async function readSensor() {
    var sdat = await microBitBle.readSensor();
    console.log("sensor:", sdat);
    isens.innerHTML = 
      "acceleration:" +
      sdat.acceleration.x +
      "," +
      sdat.acceleration.y +
      "," +
      sdat.acceleration.z +
      "  magneticField:" +
      sdat.magneticField.x +
      "," +
      sdat.magneticField.y +
      "," +
      sdat.magneticField.z +
      "," +
      "  temperature:" +
      sdat.temperature +
      "  brightness:" +
      sdat.brightness +
      "  button:" +
      sdat.button;
  }

  async function print() {
    await microBitBle.printLED(txt.value);
  }

  async function showIcon() {
    await microBitBle.showIconLED(Number(txt2.value));
  }

</script>

<svelte:head>
  <script src="https://cdn.jsdelivr.net/npm/@chirimen/microbit"></script>
</svelte:head>

<main>
  <img src={svelteLogo} alt="Svelte Logo" />
  <h1>Hello Typescript!</h1>

  <Counter />

  <p>
    Visit <a href="https://svelte.dev">svelte.dev</a> to learn how to build Svelte
    apps.
  </p>

  <p>
    Check out <a href="https://github.com/sveltejs/kit#readme">SvelteKit</a> for
    the officially supported framework, also powered by Vite!
  </p>

    <form name="js">
      <input type="button" value="Connect" on:click={connect} />
      <input type="button" value="Disconnect" onclick={disconnect} />
    </form>
    <div id="msg">---</div>
    <hr />
    <table>
      <tr>
        <td colspan="2">
          <input type="button" value="Read Sensors" on:click={readSensor} />
        </td>
      </tr>
      <tr>
        <td>Internal Sensors</td>
        <td id="isens">-</td>
      </tr>
      <tr>
        <td colspan="2">LED</td>
      </tr>
      <tr>
        <td><input id="txt" type="text" value="Hello!" /></td>
        <td><input type="button" value="Print" on:click={print} /></td>
      </tr>
      <tr>
        <td>
          <input id="txt2" style="width: 50px" type="text" value="0" />(0..39)
        </td>
        <td><input type="button" value="showIcon" on:click={showIcon} /></td>
      </tr>
    </table>

    <img src="{CMMB_Embed}" width="300" alt="proto" />

</main>

<style>
  :root {
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen,
      Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
  }

  main {
    text-align: center;
    padding: 1em;
    margin: 0 auto;
  }

  img {
    height: 16rem;
    width: 16rem;
  }

  h1 {
    color: #ff3e00;
    text-transform: uppercase;
    font-size: 4rem;
    font-weight: 100;
    line-height: 1.1;
    margin: 2rem auto;
    max-width: 14rem;
  }

  p {
    max-width: 14rem;
    margin: 1rem auto;
    line-height: 1.35;
  }

  @media (min-width: 480px) {
    h1 {
      max-width: none;
    }

    p {
      max-width: none;
    }
  }
</style>

 