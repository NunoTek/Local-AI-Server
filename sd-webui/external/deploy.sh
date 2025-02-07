#!/bin/bash

apt install zip -y


mkdir -p ./models/Stable-diffusion
mkdir -p ./models/Lora
mkdir -p ./embeddings


# mv -rf ./models/Stable-diffusion/* /stable-diffusion-webui/models/Stable-diffusion/
cp -r ./models/Stable-diffusion/* /stable-diffusion-webui/models/Stable-diffusion/
rm -rf ./models/Stable-diffusion/*

# mv -rf ./models/Lora/* /stable-diffusion-webui/models/Lora/
cp -r ./models/Lora/* /stable-diffusion-webui/models/Lora/
rm -rf ./models/Lora/*

# mv -rf ./embeddings/* /stable-diffusion-webui/embeddings/
cp -r ./embeddings/* /stable-diffusion-webui/embeddings/
rm -rf ./embeddings/*