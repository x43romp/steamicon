<script lang="ts">
  import { invoke } from "@tauri-apps/api/core";
  import listing from "../lib/components/listing.svelte";
  import Listing from "../lib/components/listing.svelte";
  import * as ButtonGroup from "$lib/components/ui/button-group";
  import { Button } from "$lib/components/ui/button";
  import { FolderTree, Library, RefreshCw } from "@lucide/svelte";

  let name = $state("");
  let greetMsg = $state("");

  async function greet(event: Event) {
    event.preventDefault();
    // Learn more about Tauri commands at https://tauri.app/develop/calling-rust/
    greetMsg = await invoke("greet", { name });
  }
</script>

<div class="container mx-auto h-screen p-4 flex flex-col overflow-hidden gap-4">
  <!-- component -->
  <div class="flex justify-between">
    <h1>Steamicon</h1>
    <ButtonGroup.Root>
      <Button variant="outline" disabled><Library />Libraries</Button>
      <Button variant="outline" disabled><FolderTree />Paths</Button>
      <Button><RefreshCw />Refresh</Button>
    </ButtonGroup.Root>
  </div>

  <!-- <div class="flex w-full max-w-lg flex-col gapV-6"> -->
  <div class="overflow-y-auto grow">
    <div
      class="overflow-y-auto grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-2"
    >
      <Listing name="Warframe" />
      <Listing name="Warframe" />
      <Listing name="Warframe" />
      <Listing name="Warframe" />
      <Listing name="Warframe" />
      <Listing name="Warframe" />
      <Listing name="Warframe" />
      <Listing name="Warframe" />
      <Listing name="Warframe" />
      <Listing />
    </div>
  </div>

  <form class="row" onsubmit={greet}>
    <input id="greet-input" placeholder="Enter a name..." bind:value={name} />
    <Button type="submit">Greeting</Button>
    <p>{greetMsg}</p>
  </form>
</div>

<style>
  :root {
    font-family: Inter, Avenir, Helvetica, Arial, sans-serif;
    font-size: 16px;
    line-height: 24px;
    font-weight: 400;

    color: #0f0f0f;
    background-color: #f6f6f6;

    font-synthesis: none;
    text-rendering: optimizeLegibility;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    -webkit-text-size-adjust: 100%;
  }
</style>
