<script lang="ts">
    import { urlStore, Url } from '../stores/urlStore';
    import { get } from 'svelte/store';
  
    let urls: Url[] = [];
  
    urlStore.subscribe(value => {
      urls = value;
    });
  </script>
  
  <ul>
    {#each urls as { id, url }}
      <li key={id}>
        <a href={url} target="_blank" rel="noopener noreferrer">{url}</a>
      </li>
    {/each}
  </ul>
  