<script setup lang="ts">
const props = defineProps<{completed: boolean, title: string, description: string}>()
</script>

<template>
  <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
    <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
      <tr>
        <th class="px-6 py-3">Completed</th>
        <th class="px-6 py-3">Title</th>
        <th class="px-6 py-3">Description</th>
      </tr>
    </thead>
    <tbody>
      <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 border-gray-200 hover:bg-gray-50 dark:hover:bg-gray-60">
        <td class="px-6 py-3">
          <span v-if="props.completed" class="text-green-500">Completed</span>
          <span v-else class="text-red-500">Not Completed</span>
        </td>
        <td class="px-6 py-3">
          <div class="flex flex-col gap-1">
            <span class="text-gray-700 font-bold">{{ props.title }}</span>
          </div>
        </td>
        <td class="px-6 py-3">
          <div>
            <span class="text-gray-700">{{ props.description }}</span>
          </div>
        </td>
      </tr>
    </tbody>
  </table>
</template>
