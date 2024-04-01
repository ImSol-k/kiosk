<template>
    <div class="wrap">
        <vue-slides  class="in" :touchable="false" :bullets="false" :arrows="false" ref="first">
            <vueper-slide :key="1">
            <div></div>
        </vueper-slide>
        </vue-slides>
    </div><!--wrap-->
</template>
<script>
import { VueperSlides, VueperSlide } from 'vueperslides'
import '../../assets/css/attention.css'
import '../../assets/css/receipt.css'

export default {
    name: "ReceiptView",
    components: {},
    data() {
        return {
        };
    },
    methods: {
    },
    created() { 
    }
};
</script>

<style></style>