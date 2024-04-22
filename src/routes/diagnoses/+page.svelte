
<script>
  import DiagnosisItem from '$lib/components/DiagnosisItem.svelte';

  let diagnoses = [
    { diagnosis: 'Brakes', cost: '500' },
    { diagnosis: 'Software and engine', cost: '600' },
    { diagnosis: 'Transmission', cost: '100' },
  ];
</script>

<div class="space-y-4">
  {#each diagnoses as diagnosis (diagnosis.id)}
    <DiagnosisItem {diagnosis} {cost} />
  {/each}
</div>
    