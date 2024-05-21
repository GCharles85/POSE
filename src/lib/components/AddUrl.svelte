<script lang="ts">
    import { urlStore, Url } from '../stores/UrlStore';
    import { get } from 'svelte/store';
  
    let newUrl = '';
  
    const addUrl = () => {
      if (newUrl.trim()) {
        urlStore.update(urls => {
          const id = urls.length ? urls[urls.length - 1].id + 1 : 1;
          return [...urls, { id, url: newUrl }];
        });
        newUrl = '';
      }
    };
  </script>
  
  <div>
    <input type="text" bind:value={newUrl} placeholder="Enter URL" />
    <button on:click={addUrl}>Add URL</button>
  </div>
  