<script lang="ts">
  import AddUrl from '$lib/components/AddUrl.svelte';
  import UrlList from '$lib/components/UrlList.svelte';
</script>

<main>
  <h1 style="font-family: 'Lobster', cursive;">Add Links to Your Favorite Communities Here</h1>
  <AddUrl />
  <UrlList />
</main>

<div style="font-family: 'Lobster', cursive; background-color: green; color: white; padding: 10px; border-radius: 5px; text-align: center; width: 100%; position: fixed; bottom: 0;">
  Find your place!
</div>


<div style="font-family: 'Lobster', cursive; padding-top: 20px;">
  <a href="https://www.mindfulnesscenter.org/" >Mindfulness ⊹╰(⌣ʟ⌣)╯⊹</a>
</div>

<style>

  main {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    margin-bottom: 20px;
    font-size: .7rem;
    /*padding-left: 1rem; Optional: Add padding for better spacing from the edge */
  }

</style>

  
  


