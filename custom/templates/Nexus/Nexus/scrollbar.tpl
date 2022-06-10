<style>
    {if $NEXUS_DARK_MODE eq '1' }
        ::-webkit-scrollbar {
            width: 6px;
            background-color: #1b1b1b;
        }

        ::-webkit-scrollbar-thumb {
            background: #292929;
            border-radius: 10px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: #303030;
        }

    {else}
        ::-webkit-scrollbar {
            width: 6px;
            background-color: #f3f6fa;
        }

        ::-webkit-scrollbar-thumb {
            background: #d4d4d5;
            border-radius: 10px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: #c3c4c6;
        }

    {/if}
</style>