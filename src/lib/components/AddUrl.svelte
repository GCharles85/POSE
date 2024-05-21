<script lang="ts">
    import { urlStore, Url } from '../stores/UrlStore';
    import { get } from 'svelte/store';
  
    let newUrl = '';
  
    const addUrl = () => {
        var formattedUrl = newUrl.trim();

        // Check if the URL already starts with "http://" or "https://"
        if (!/^https?:\/\//i.test(formattedUrl)) {
            // If not, prepend "https://"
            formattedUrl = `https://${formattedUrl}`;
        }

        // Update the store with the formatted URL
        urlStore.update(urls => {
        const id = urls.length ? urls[urls.length - 1].id + 1 : 1;
        return [...urls, { id, url: formattedUrl }];
        });
    }
  </script>
  
  <div>
    <input type="text" bind:value={newUrl} placeholder="Enter URL" />
    <button on:click={addUrl}>Add URL</button>
  </div>
  