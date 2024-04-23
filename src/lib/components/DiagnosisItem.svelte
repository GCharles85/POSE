<script lang="ts">
  export let diagnosis: {
    diagnosis: string;
    cost: string;
    id: string;
  };
</script>

<div class="border-b py-3">
  <h3 class="text-lg">{diagnosis.diagnosis}</h3>
  <p class="text-sm text-gray-600">Estimated costs: ${diagnosis.cost}</p>
</div>

    