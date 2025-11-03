<script>
    import { Download } from "@lucide/svelte";
    import Button from "./ui/button/button.svelte";
    import * as Item from "./ui/item";
    import { Avatar } from "bits-ui";

    export let name = "Placeholder";
    let warn = name == "Placeholder";
</script>

<!-- <div class="flex w-full max-w-lg flex-col gapV-6"> -->
<Item.Root variant="outline" class="w-full pr-10 {warn ? 'border-primary' : ''}">
    <Item.Media>
        {#if !warn}
            <Avatar.Root class="size-10">
                <Avatar.Image src="/favicon.png"></Avatar.Image>
                <Avatar.Fallback>WF</Avatar.Fallback>
            </Avatar.Root>
        {:else}
            <Button
                size="icon"
                variant="default"
                class="rounded-full"
                aria-label="Invite"
            >
                <Download />
            </Button>
        {/if}
    </Item.Media>
    <Item.Content>
        <Item.Title>{name ?? "Placeholder"}</Item.Title>
        <!-- <Item.Description>Downloaded</Item.Description> -->
    </Item.Content>
    <Item.Actions></Item.Actions>
</Item.Root>

<!-- </div> -->

<style>
</style>
