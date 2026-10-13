# IoT

- `2025-1/domotica-vue-arduino` — domótica com Vue 3 + TypeScript (Vite, Pinia, Vue Router, Axios, PrimeFlex, Sass): telas de dispositivos e de gerenciamento, com ambientes e dispositivos lidos do Contentful (CDN e API de gestão). `firmware/firmware.ino` é o firmware do ESP32 (WiFi, HTTPClient, ArduinoJson), feito para o simulador Wokwi, que consulta o mesmo conteúdo.

## Como rodar
1. `npm install`
2. copie `.env.example` para `.env` e preencha `VITE_CONTENTFUL_BASE_ENDPOINT`, `VITE_CONTENTFUL_CDN_TOKEN` e `VITE_CONTENTFUL_API_TOKEN`
3. `npm run dev`

No firmware, troque `COLOQUE_SEU_TOKEN_CDA_AQUI` pelo token de leitura (o mesmo `VITE_CONTENTFUL_CDN_TOKEN`).

## Observações da revisão
- O repositório original versionava o `.env` com os tokens do Contentful, e o firmware trazia o token de leitura escrito no código. Esta cópia veio sem o `.env` (há um `.env.example`) e com o token do firmware trocado por um marcador. Como esses tokens já estiveram versionados, vale revogá-los no Contentful e gerar outros.
- A URL do Contentful no firmware inclui o id do espaço; não é segredo, mas é da conta do dono.
