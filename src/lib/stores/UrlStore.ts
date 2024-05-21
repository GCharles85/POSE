import { writable } from 'svelte/store';

export interface Url {
  id: number;
  url: string;
}

const initialUrls: Url[] = [];

export const urlStore = writable<Url[]>(initialUrls);

export function removeUrl(id: number) {
    urlStore.update(urls => urls.filter(url => url.id !== id));
}