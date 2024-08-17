variable "REGISTRY" {
    default = "docker.io"
}

variable "REGISTRY_USER" {
    default = "dohkoxxx"
}

variable "APP" {
    default = "stable-diffusion-webui"
}

variable "RELEASE" {
    default = "7.4.3"
}

variable "CU_VERSION" {
    default = "121"
}

variable "BASE_IMAGE_REPOSITORY" {
    default = "ashleykza/a1111"
}

variable "BASE_IMAGE_VERSION" {
    default = "1.10.0.post7"
}

variable "PYTHON_VERSION" {
    default = "3.10"
}

target "default" {
    dockerfile = "Dockerfile"
    tags = ["${REGISTRY}/${REGISTRY_USER}/${APP}:${RELEASE}"]
    args = {
        RELEASE = "${RELEASE}"
        BASE_IMAGE = "${BASE_IMAGE_REPOSITORY}:${BASE_IMAGE_VERSION}"
        INDEX_URL = "https://download.pytorch.org/whl/cu${CU_VERSION}"

        KOHYA_VERSION = "v24.1.6"
        KOHYA_TORCH_VERSION = "2.1.2+cu${CU_VERSION}"
        KOHYA_XFORMERS_VERSION = "0.0.23.post1"

        INVOKEAI_VERSION = "4.2.7"
        INVOKEAI_TORCH_VERSION = "2.2.2+cu${CU_VERSION}"
        INVOKEAI_XFORMERS_VERSION = "0.0.25.post1"

        COMFYUI_COMMIT = "0a6b0081176c6233015ec00d004c534c088ddcb0"
        COMFYUI_TORCH_VERSION = "2.4.0+cu${CU_VERSION}"
        COMFYUI_XFORMERS_VERSION = "0.0.27.post2"

        VENV_PATH = "/workspace/venvs/a1111"
    }
}
