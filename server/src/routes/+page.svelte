<script lang="ts">
  import Image from '$lib/components/Image.svelte';
  import { Globe } from 'lucide-svelte';
  import { Flame } from 'lucide-svelte';
</script>

<!-- svelte-ignore missing-declaration -->
<svelte:head>
  <title>Svelte Template</title>
  <meta
    name="description"
    content="Simple SvelteKit template with built in Tailwind, Lucide Icons support and with SEO in mind. "
  />

  <!-- OpenGraph -->
  <meta property="og:title" content="Svelte Template" />
  <meta
    property="og:description"
    content="Simple SvelteKit template with built in Tailwind, Lucide Icons support and with SEO in mind. "
  />
  <meta property="og:image" content="/favicon.ico" />
  <meta property="og:url" content={`${__SITE_URL__}/`} />
  <meta property="og:type" content="website" />
  <meta property="og:locale" content="en_US" />
</svelte:head>

<div class="h-screen flex items-center justify-center">
  <Flame size={50} />
  <Image
    src="/favicon.ico"
    width={150}
    height={150}
    alt="The Svelte logo"
    layout="fixed"
    priority={true}
  />
  <Globe size={50} />
</div>

<style lang="postcss">
  div > :global(*) {
    margin: 0;
    padding: 0;
    @apply hover:scale-105 transition-transform;

    &:not(Image) {
      color: #dddddd;
      margin: 0 0.5rem;
    }
  }
</style>
