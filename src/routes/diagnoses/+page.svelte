
<script>
  import DiagnosisItem from '$lib/components/DiagnosisItem.svelte';

  let diagnoses = [
    { diagnosis: 'Brakes', cost: '500', id: '0' },
    { diagnosis: 'Software and engine', cost: '600', id: '00' },
    { diagnosis: 'Transmission', cost: '100', id: '000' },
  ];
</script>

<div class="space-y-4">
  {#each diagnoses as diagnosis (diagnosis.id)}
    <DiagnosisItem {diagnosis}  />
  {/each}
</div>
    