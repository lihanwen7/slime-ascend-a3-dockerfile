# ONE FILE: ARM64 / Ascend A3 CANN + SGLang + Megatron + Slime.
# Copy only this Dockerfile to an empty directory and build there:
# DOCKER_BUILDKIT=0 docker build --build-arg TARGETPLATFORM=linux/arm64 \
#   --build-arg BUILD_JOBS=32 --build-arg OPS_BUILD_JOBS=64 \
#   -t my-slime-native:9.2.0-a3-top16 .
# From the original repository root, also set:
#   --build-arg DOCKERFILE_SOURCE=cann/9.2.0-a3-openeuler24.03-py3.12/Dockerfile
#   -f cann/9.2.0-a3-openeuler24.03-py3.12/Dockerfile
# Dependency constraints below are comments read from this file during build.
# Source fixes are in the pinned user repos; A3 mHC and SMLA use official operators.
# No patches or companion files are required; installed CANN files are left intact.

# region Python dependency pins; source repositories are pinned below.
# BEGIN_NATIVE_CONSTRAINTS
# # Version constraints captured from glm5.3_flash_native; source builds are pinned separately.
# absl-py==2.5.1
# accelerate==1.15.0
# aiohappyeyeballs==2.7.1
# aiohttp==3.14.5
# aiohttp-cors==0.8.1
# aiosignal==1.4.0
# airportsdata==20260905
# aniso8601==10.0.1
# annotated-doc==0.0.5
# annotated-types==0.8.0
# anthropic==1.15.0
# anyio==4.15.1
# apache-tvm-ffi==0.1.14.post1
# asttokens==3.0.2
# attrs==24.2.0
# av==19.0.1
# blake3==1.0.11
# blinker==1.9.0
# blobfile==3.0.0
# bracex==3.1
# build==1.6.1
# certifi==2026.7.22
# cffi==2.1.1
# charset-normalizer==3.5.2
# click==8.5.0
# cloudpickle==3.1.2
# colorama==0.4.6
# colorful==0.5.8
# compressed-tensors==0.19.0
# connectrpc==0.11.1
# cryptography==50.0.2
# custom_ops==1.0
# datasets==5.1.0
# decorator==5.1.1
# decord2==3.4.0
# dill==0.4.1
# diskcache==5.6.3
# distlib==0.4.4
# distro==1.9.0
# docstring_parser==0.18.0
# e2b==2.56.0
# e2b-dockerfile-utils==0.1.1
# easydict==1.13
# einops==0.8.2
# execnet==2.1.2
# executing==2.3.0
# expecttest==0.3.0
# fastapi==0.143.3
# filelock==4.2.0
# Flask==3.1.3
# Flask-RESTful==0.3.10
# frozenlist==1.8.0
# fsspec==2026.7.0
# gguf==0.19.0
# gitdb==4.0.12
# GitPython==3.2.1
# google-api-core==2.42.0
# google-auth==2.62.0
# googleapis-common-protos==1.75.5
# griffe==1.15.0
# grpcio==1.84.0
# grpcio-health-checking==1.81.1
# grpcio-reflection==1.81.1
# h11==0.16.0
# h2==4.4.1
# hf-xet==1.7.0
# hf_transfer==0.1.9
# hpack==4.2.0
# httpcore==1.0.9
# httpcore2==2.13.1
# httpx==0.28.1
# httpx2==2.13.1
# huggingface_hub==1.33.0
# hyperframe==6.1.0
# idna==3.20
# iniconfig==2.3.1
# interegular==0.3.3
# ipython==9.12.0
# ipython_pygments_lexers==1.1.1
# itsdangerous==2.2.0
# jedi==0.20.1
# Jinja2==3.1.6
# jiter==0.17.0
# jsonschema==4.26.0
# jsonschema-specifications==2025.9.1
# lark==1.3.1
# linkify-it-py==2.2.0
# llguidance==1.7.6
# llvmlite==0.50.0
# loguru==0.7.3
# lxml==6.1.3
# Markdown==3.11.1
# markdown-it-py==4.2.0
# MarkupSafe==3.0.4
# matplotlib-inline==0.2.2
# mcp==2.3.0
# mcp-types==2.3.0
# mdit-py-plugins==0.6.1
# mdurl==0.1.2
# memfabric_hybrid==1.1.4
# memray==1.20.0
# mistral_common==1.12.0
# modelscope==1.40.2
# modelscope-hub==0.4.6
# mpmath==1.3.0
# msgpack==1.2.3
# msgspec==0.22.0
# multidict==7.1.0
# multiprocess==0.70.19
# nest-asyncio==1.6.0
# networkx==3.7
# ninja==1.13.2
# numba==0.68.0
# numpy==1.26.4
# nvdlfw_inspect==0.2.2
# omegaconf==2.4.0
# openai==2.6.1
# openai-agents==0.0.7
# openai-harmony==0.0.4
# opencensus==0.11.4
# opencensus-context==0.1.3
# opentelemetry-api==1.45.1
# opentelemetry-exporter-prometheus==0.66b1
# opentelemetry-proto==1.45.1
# opentelemetry-sdk==1.45.1
# opentelemetry-semantic-conventions==0.66b1
# orjson==3.13.0
# outlines==0.1.11
# outlines_core==0.1.26
# packaging==26.3
# pandas==3.0.6
# parso==0.8.7
# partial-json-parser==0.2.1.1.post7
# pexpect==4.9.0
# pillow==11.3.0
# pip==26.2.1
# platformdirs==4.13.3
# pluggy==1.7.0
# prometheus_client==0.26.0
# prompt_toolkit==3.0.53
# propcache==0.5.4
# proto-plus==1.29.0
# protobuf==6.33.5
# protobuf-py==0.1.1
# protobuf-py-ext==0.1.1
# psutil==6.0.0
# ptyprocess==0.7.0
# pure_eval==0.2.4
# py-spy==0.4.2
# pyarrow==24.0.0
# pyasn1==0.6.4
# pyasn1_modules==0.4.2
# pybase64==1.5.1
# pybind11==3.1.0
# pycountry==26.2.16
# pycparser==3.11
# pycryptodomex==3.24.1
# pydantic==2.14.1
# pydantic-extra-types==2.11.1
# pydantic_core==2.50.1
# Pygments==2.21.0
# PyJWT==2.15.1
# pylatexenc==2.10
# pyproject_hooks==1.3.3
# pyqwest==0.12.0
# pytest==8.3.2
# pytest-xdist==3.6.1
# python-dateutil==2.9.0.post0
# python-discovery==1.6.3
# python-dotenv==1.2.4
# python-multipart==0.0.32
# pytz==2026.5
# PyYAML==6.0.3
# pyzmq==27.2.0
# qwen-vl-utils==0.0.14
# ray==2.49.2
# referencing==0.37.0
# regex==2026.9.29
# requests==2.34.2
# rich==15.0.0
# rpds-py==2026.9.1
# safetensors==0.8.0
# scipy==1.13.1
# sentencepiece==0.2.2
# sentry-sdk==2.72.0
# setproctitle==1.3.8
# setuptools==84.0.0
# setuptools-scm==10.3.4
# sglang-router==0.3.2
# shellingham==1.5.4
# six==1.17.0
# smart_open==8.0.3
# smg-grpc-proto==0.4.27
# smg-grpc-servicer==0.14.0
# smmap==5.0.3
# sniffio==1.3.1
# soundfile==0.13.1
# sse-starlette==3.5.0
# stack-data==0.6.3
# starlette==1.8.0
# straw-queue==0.1.3
# sympy==1.14.0
# tensorboard==2.21.0
# tensorboard-data-server==0.7.2
# textual==8.2.8
# tiktoken==0.14.0
# timm==1.0.16
# tokenizers==0.22.2
# torch==2.10.0
# torch_npu==2.10.0.post7
# torchao==0.9.0
# torchvision==0.25.0
# tqdm==4.70.1
# traitlets==5.16.1
# transformers==5.12.1
# triton==3.5.0
# triton_ascend==3.2.2
# truststore==0.10.5
# typer==0.27.3
# types-requests==2.33.0.20261006
# typing-inspection==0.4.4
# typing_extensions==4.16.0
# urllib3==2.8.0
# uv==0.13.1
# uvicorn==0.54.0
# uvloop==0.23.0
# vcs-versioning==2.6.0
# virtualenv==21.14.8
# wandb==0.23.0
# wcmatch==11.1
# wcwidth==0.9.2
# Werkzeug==3.1.9
# wheel==0.48.0
# wrapt==2.5.1
# xgrammar==0.2.1
# xxhash==4.0.1
# yarl==1.25.1
# zstandard==0.25.0
# END_NATIVE_CONSTRAINTS
# endregion

# Stage 1: Install Python
# Optional public CA for networks using TLS inspection; empty on normal networks.
ARG EXTRA_CA_CERT_B64=""
FROM swr.cn-north-4.myhuaweicloud.com/ddn-k8s/docker.io/openeuler/openeuler:24.03-linuxarm64 AS python-installer
ARG EXTRA_CA_CERT_B64
RUN if [ -n "${EXTRA_CA_CERT_B64}" ]; then \
        mkdir -p /etc/pki/ca-trust/source/anchors && \
        printf "%s" "${EXTRA_CA_CERT_B64}" | base64 -d > /etc/pki/ca-trust/source/anchors/build-extra-ca.crt && \
        update-ca-trust extract; \
    fi
ENV PIP_CERT=/etc/pki/tls/certs/ca-bundle.crt

# Python Environment variables
ENV PATH=/usr/local/python3.12.15/bin:${PATH}

# Use the verified Huawei Cloud mirror for the same openEuler repositories.
RUN sed -i '/^metalink=/d;s@https://repo.openeuler.org/@https://repo.huaweicloud.com/openeuler/@g;s@http://repo.openeuler.org/@https://repo.huaweicloud.com/openeuler/@g' /etc/yum.repos.d/*.repo \
    && yum update -y && \
    yum install -y \
        gcc \
        gcc-c++ \
        make \
        cmake \
        curl \
        zlib-devel \
        bzip2-devel \
        openssl-devel \
        ncurses-devel \
        sqlite-devel \
        readline-devel \
        tk-devel \
        gdbm-devel \
        libpcap-devel \
        xz-devel \
        libev-devel \
        expat-devel \
        libffi-devel \
        systemtap-sdt-devel \
    && yum clean all \
    && rm -rf /var/cache/yum \
    && rm -rf /tmp/*

# Install Python
RUN curl -fsSL https://repo.huaweicloud.com/python/3.12.15/Python-3.12.15.tgz -o /tmp/Python-3.12.15.tgz && \
    tar -xf /tmp/Python-3.12.15.tgz -C /tmp && \
    cd /tmp/Python-3.12.15 && \
    mkdir -p /usr/local/python3.12.15/lib && \
    ./configure --enable-shared --enable-shared LDFLAGS="-Wl,-rpath /usr/local/python3.12.15/lib" --prefix=/usr/local/python3.12.15 && \
    make -j $(nproc) && \
    make altinstall && \
    ln -sf /usr/local/python3.12.15/bin/python3.12 /usr/local/python3.12.15/bin/python3 && \
    ln -sf /usr/local/python3.12.15/bin/pip3.12 /usr/local/python3.12.15/bin/pip3 && \
    ln -sf /usr/local/python3.12.15/bin/python3 /usr/local/python3.12.15/bin/python && \
    ln -sf /usr/local/python3.12.15/bin/pip3 /usr/local/python3.12.15/bin/pip && \
    rm -rf /tmp/*

# Stage 2: Install CANN
FROM python-installer AS cann-installer

ARG TARGETPLATFORM

# Use the verified Huawei Cloud mirror for the same openEuler repositories.
RUN sed -i '/^metalink=/d;s@https://repo.openeuler.org/@https://repo.huaweicloud.com/openeuler/@g;s@http://repo.openeuler.org/@https://repo.huaweicloud.com/openeuler/@g' /etc/yum.repos.d/*.repo \
    && yum update -y && \
    yum install -y \
        unzip \
        pciutils \
        net-tools \
        lapack-devel \
        gcc-gfortran \
        util-linux \
        findutils \
        wget \
    && yum clean all \
    && rm -rf /var/cache/yum

# Note: Install CANN runtime dependencies
ENV PIP_INDEX_URL=https://repo.huaweicloud.com/repository/pypi/simple
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir \
        attrs cython numpy decorator sympy cffi pyyaml pathlib2 \
        psutil protobuf==3.20 scipy requests absl-py

# Note: Get the download link according to ARCH and download the installation package
RUN ARCH=$(case "${TARGETPLATFORM}" in \
        "linux/amd64") echo "x86_64" ;; \
        "linux/arm64") echo "aarch64" ;; \
        *) echo "Unsupported TARGETPLATFORM: ${TARGETPLATFORM}" && exit 1 ;; \
    esac) && \
    CANN_TOOLKIT_URL=https://ascend-repo.obs.cn-east-2.myhuaweicloud.com/CANN/CANN%209.2.0/Ascend-cann-toolkit_9.2.0_linux-${ARCH}.run && \
    CANN_OPS_URL=https://ascend-repo.obs.cn-east-2.myhuaweicloud.com/CANN/CANN%209.2.0/Ascend-cann-A3-ops_9.2.0_linux-${ARCH}.run && \
    CANN_NNAL_URL=https://ascend-repo.obs.cn-east-2.myhuaweicloud.com/CANN/CANN%209.2.0/Ascend-cann-nnal_9.2.0_linux-${ARCH}.run && \
    wget --progress=dot:mega --header="Referer: https://www.hiascend.com/" ${CANN_TOOLKIT_URL} -O ~/Ascend-cann-toolkit.run && \
    wget --progress=dot:mega --header="Referer: https://www.hiascend.com/" ${CANN_OPS_URL} -O ~/Ascend-cann-ops.run && \
    wget --progress=dot:mega --header="Referer: https://www.hiascend.com/" ${CANN_NNAL_URL} -O ~/Ascend-cann-nnal.run

# Note: Install CANN Toolkit Development Kit Package
RUN chmod +x ~/Ascend-cann-toolkit.run && \
    ~/Ascend-cann-toolkit.run --quiet --install --install-for-all && \
    rm -f ~/Ascend-cann-toolkit.run

# Note: Install CANN Ops Operator Package
RUN chmod +x ~/Ascend-cann-ops.run && \
    ~/Ascend-cann-ops.run --quiet --install --install-for-all && \
    rm -f ~/Ascend-cann-ops.run

# Note: Install CANN NNAL Neural Network Acceleration Library
RUN . /usr/local/Ascend/ascend-toolkit/set_env.sh && \
    chmod +x ~/Ascend-cann-nnal.run && \
    ~/Ascend-cann-nnal.run --quiet --install --install-for-all && \
    rm -f ~/Ascend-cann-nnal.run
    
# Stage 3: Copy results from previous stages
FROM swr.cn-north-4.myhuaweicloud.com/ddn-k8s/docker.io/openeuler/openeuler:24.03-linuxarm64 AS official-openeuler
ENV PIP_INDEX_URL=https://repo.huaweicloud.com/repository/pypi/simple
ARG EXTRA_CA_CERT_B64
RUN if [ -n "${EXTRA_CA_CERT_B64}" ]; then \
        mkdir -p /etc/pki/ca-trust/source/anchors && \
        printf "%s" "${EXTRA_CA_CERT_B64}" | base64 -d > /etc/pki/ca-trust/source/anchors/build-extra-ca.crt && \
        update-ca-trust extract; \
    fi
ENV PIP_CERT=/etc/pki/tls/certs/ca-bundle.crt

ARG TARGETPLATFORM

# Python Environment variables
ENV PATH=/usr/local/python3.12.15/bin:${PATH}

# Note: Toolkit Environment variables, obtained from /usr/local/Ascend/ascend-toolkit/set_env.sh
ENV ASCEND_TOOLKIT_HOME=/usr/local/Ascend/cann-9.2.0
ENV ASCEND_TOOLKIT_LATEST_HOME=/usr/local/Ascend/ascend-toolkit/latest

ENV PYTHONPATH=${ASCEND_TOOLKIT_HOME}/python/site-packages:${ASCEND_TOOLKIT_HOME}/opp/built-in/op_impl/ai_core/tbe:$PYTHONPATH
ENV PYTHONPATH=${ASCEND_TOOLKIT_LATEST_HOME}/python/site-packages:${ASCEND_TOOLKIT_LATEST_HOME}/opp/built-in/op_impl/ai_core/tbe:$PYTHONPATH
ENV PATH=${ASCEND_TOOLKIT_HOME}/bin:${ASCEND_TOOLKIT_HOME}/tools/ccec_compiler/bin:${ASCEND_TOOLKIT_HOME}/tools/profiler/bin:${ASCEND_TOOLKIT_HOME}/tools/ascend_system_advisor/asys:$PATH
ENV PATH=${ASCEND_TOOLKIT_HOME}/tools/show_kernel_debug_data:${ASCEND_TOOLKIT_HOME}/tools/msobjdump:$PATH
ENV PATH=${ASCEND_TOOLKIT_LATEST_HOME}/bin:${ASCEND_TOOLKIT_LATEST_HOME}/compiler/ccec_compiler/bin:${ASCEND_TOOLKIT_LATEST_HOME}/tools/ccec_compiler/bin:$PATH
ENV ASCEND_AICPU_PATH=${ASCEND_TOOLKIT_HOME}
ENV ASCEND_OPP_PATH=${ASCEND_TOOLKIT_HOME}/opp
ENV TOOLCHAIN_HOME=${ASCEND_TOOLKIT_HOME}/toolkit
ENV ASCEND_HOME_PATH=${ASCEND_TOOLKIT_HOME}
ENV CMAKE_PREFIX_PATH=${TOOLCHAIN_HOME}/tools/tikicpulib/lib/cmake:${ASCEND_TOOLKIT_HOME}/lib64/cmake

# Note: NNAL Environment variables, obtained from /usr/local/Ascend/nnal/set_env.sh
ENV ATB_HOME_PATH=/usr/local/Ascend/nnal/atb/latest/atb/cxx_abi_1
ENV LD_LIBRARY_PATH=${ASCEND_TOOLKIT_LATEST_HOME}/lib64:${ASCEND_TOOLKIT_LATEST_HOME}/lib64/plugin/opskernel:${ASCEND_TOOLKIT_LATEST_HOME}/lib64/plugin/nnengine:${ASCEND_TOOLKIT_LATEST_HOME}/opp/built-in/op_impl/ai_core/tbe/op_tiling:$LD_LIBRARY_PATH
ENV LD_LIBRARY_PATH=${ASCEND_TOOLKIT_LATEST_HOME}/tools/aml/lib64:${ASCEND_TOOLKIT_LATEST_HOME}/tools/aml/lib64/plugin:$LD_LIBRARY_PATH
ENV LD_LIBRARY_PATH=${ATB_HOME_PATH}/lib:${ATB_HOME_PATH}/examples:${ATB_HOME_PATH}/tests/atbopstest:${LD_LIBRARY_PATH}
ENV LD_LIBRARY_PATH=/usr/local/Ascend/driver/lib64:/usr/local/Ascend/driver/lib64/common:/usr/local/Ascend/driver/lib64/driver:$LD_LIBRARY_PATH
ENV LD_LIBRARY_PATH=${ASCEND_TOOLKIT_HOME}/lib64:${ASCEND_TOOLKIT_HOME}/lib64/plugin/opskernel:${ASCEND_TOOLKIT_HOME}/lib64/plugin/nnengine:${ASCEND_TOOLKIT_HOME}/opp/built-in/op_impl/ai_core/tbe/op_tiling:$LD_LIBRARY_PATH
ENV PATH=${ATB_HOME_PATH}/bin:$PATH
ENV ATB_STREAM_SYNC_EVERY_KERNEL_ENABLE=0
ENV ATB_STREAM_SYNC_EVERY_RUNNER_ENABLE=0
ENV ATB_STREAM_SYNC_EVERY_OPERATION_ENABLE=0
ENV ATB_OPSRUNNER_KERNEL_CACHE_LOCAL_COUNT=1
ENV ATB_OPSRUNNER_KERNEL_CACHE_GLOABL_COUNT=5
ENV ATB_WORKSPACE_MEM_ALLOC_ALG_TYPE=1
ENV ATB_COMPARE_TILING_EVERY_KERNEL=0
ENV ATB_SHARE_MEMORY_NAME_SUFFIX=""
ENV ATB_MATMUL_SHUFFLE_K_ENABLE=1
ENV LCCL_DETERMINISTIC=0
ENV LCCL_PARALLEL=0
ENV ATB_CXX_ABI=1

SHELL [ "/bin/bash", "-c" ]

# Use the verified Huawei Cloud mirror for the same openEuler repositories.
RUN sed -i '/^metalink=/d;s@https://repo.openeuler.org/@https://repo.huaweicloud.com/openeuler/@g;s@http://repo.openeuler.org/@https://repo.huaweicloud.com/openeuler/@g' /etc/yum.repos.d/*.repo \
    && yum update -y && \
    yum install -y \
        ca-certificates \
        bash \
        glibc \
        sqlite-devel \
        gcc \
        gcc-c++ \
        make \
        cmake \
        git \
        vim \
        wget \
        jq \
        curl \
        numactl-devel \
    && yum clean all \
    && rm -rf /var/cache/yum \
    && rm -rf /tmp/*

COPY --from=cann-installer /usr/local/python3.12.15 /usr/local/python3.12.15
COPY --from=cann-installer /usr/local/Ascend /usr/local/Ascend
COPY --from=cann-installer /etc/Ascend /etc/Ascend

# Note: Set environment variables
RUN \
    ARCH=$(case "${TARGETPLATFORM}" in \
        "linux/amd64") echo "x86_64" ;; \
        "linux/arm64") echo "aarch64" ;; \
        *) echo "Unsupported TARGETPLATFORM: ${TARGETPLATFORM}" && exit 1 ;; \
    esac) && \
    ln -sf /usr/include/c++/12/${ARCH}-openEuler-linux /usr/include/c++/12/${ARCH}-linux-gnu && \
    CANN_TOOLKIT_ENV_FILE="/usr/local/Ascend/ascend-toolkit/set_env.sh" && \
    CANN_BISHENG_ENV_FILE="/usr/local/Ascend/cann-9.2.0/share/info/ascendnpu-ir/bin/set_env.sh" && \
    CANN_NNAL_ENV_FILE="/usr/local/Ascend/nnal/atb/set_env.sh --cxx_abi=${ATB_CXX_ABI:-1}" && \
    echo "source ${CANN_TOOLKIT_ENV_FILE}" >> /etc/profile && \
    echo "source ${CANN_TOOLKIT_ENV_FILE}" >> ~/.bashrc && \
    echo "source ${CANN_BISHENG_ENV_FILE}" >> /etc/profile && \
    echo "source ${CANN_BISHENG_ENV_FILE}" >> ~/.bashrc && \
    echo "source ${CANN_NNAL_ENV_FILE}" >> /etc/profile && \
    echo "source ${CANN_NNAL_ENV_FILE}" >> ~/.bashrc

ENTRYPOINT ["/bin/bash", "-c", "\
    source /usr/local/Ascend/ascend-toolkit/set_env.sh && \
    source /usr/local/Ascend/cann-9.2.0/share/info/ascendnpu-ir/bin/set_env.sh && \
    source /usr/local/Ascend/nnal/atb/set_env.sh --cxx_abi=${ATB_CXX_ABI:-1} && \
    exec \"$@\"", "--"]

# ============================================================================
# 4. Training build tools and shared SDK environment
# ============================================================================
FROM official-openeuler AS toolchain
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
# Build jobs are separate from training parameters. Override these two arguments
# on a smaller or shared builder; do not use every CPU for every component.
ARG BUILD_JOBS=32
ARG OPS_BUILD_JOBS=64
ENV VIRTUAL_ENV=/opt/venv \
    PATH=/opt/venv/bin:${PATH} \
    PYTHONNOUSERSITE=1 \
    PYTHONUNBUFFERED=1 \
    TORCH_DEVICE_BACKEND_AUTOLOAD=0 \
    FLA_NPU_DISABLE_PTH=1 \
    PIP_CERT=/etc/pki/tls/certs/ca-bundle.crt \
    REQUESTS_CA_BUNDLE=/etc/pki/tls/certs/ca-bundle.crt \
    GIT_SSL_CAINFO=/etc/pki/tls/certs/ca-bundle.crt
# Use the verified Huawei Cloud mirror for the same openEuler repositories.
RUN sed -i '/^metalink=/d;s@https://repo.openeuler.org/@https://repo.huaweicloud.com/openeuler/@g;s@http://repo.openeuler.org/@https://repo.huaweicloud.com/openeuler/@g' /etc/yum.repos.d/*.repo \
    && yum install -y gcc gcc-c++ make cmake git ninja-build patch unzip zip \
        numactl numactl-devel libaio-devel libgomp libatomic \
        mesa-libGL libglvnd-glx libX11 libXext libxcb libXau \
        openssl-devel libffi-devel procps-ng iproute util-linux which rust cargo \
    && yum clean all \
    && /usr/local/python3.12.15/bin/python -m venv /opt/venv

# Small environment setup shared by build shells, docker run and interactive bash.
RUN printf '%s\n' \
      'set +u' \
      'source /usr/local/Ascend/ascend-toolkit/set_env.sh' \
      'source /usr/local/Ascend/nnal/atb/set_env.sh --cxx_abi=1' \
      'source /usr/local/Ascend/cann-9.2.0/share/info/ascendnpu-ir/bin/set_env.sh' \
      'for vendor in "$ASCEND_OPP_PATH/vendors/customize" "$ASCEND_OPP_PATH/vendors/custom_transformer" /opt/venv/lib/python3.12/site-packages/fla_npu/opp/vendors/fla_npu_transformer /opt/venv/lib/python3.12/site-packages/deep_ep/vendors/hwcomputing; do' \
      '    if [[ -f "$vendor/bin/set_env.bash" ]]; then source "$vendor/bin/set_env.bash"; fi' \
      'done' > /etc/profile.d/ascend-training.sh \
    && printf '%s\n' '#!/bin/bash' 'set -e' 'unset PIP_CONSTRAINT' 'exec "$@"' > /usr/local/bin/ascend-entrypoint \
    && chmod +x /usr/local/bin/ascend-entrypoint \
    && echo 'source /etc/profile.d/ascend-training.sh' >> /root/.bashrc
ENV BASH_ENV=/etc/profile.d/ascend-training.sh \
    PIP_CONSTRAINT=/opt/native-constraints.txt \
    MAX_JOBS=${BUILD_JOBS} \
    CMAKE_BUILD_PARALLEL_LEVEL=${BUILD_JOBS} \
    MAKEFLAGS=-j${BUILD_JOBS}
# Read dependency constraints from this Dockerfile itself.
# Default works when building in the directory containing this single file.
ARG DOCKERFILE_SOURCE=Dockerfile
COPY ${DOCKERFILE_SOURCE} /opt/build.Dockerfile
RUN sed -n '/^# BEGIN_NATIVE_CONSTRAINTS$/,/^# END_NATIVE_CONSTRAINTS$/ { /^# BEGIN_/d; /^# END_/d; s/^# \{0,1\}//p; }' /opt/build.Dockerfile > /opt/native-constraints.txt

# ============================================================================
# 5. Git checkouts: source compatibility changes are included in pinned commits
# User forks are the primary code; commits remain inspectable inside the image.
# ============================================================================
# slime-ascend-glm53-npu
RUN git clone --no-checkout --depth 1 https://github.com/lihanwen7/slime-ascend-glm53-npu.git /opt/src/slime-ascend \
    && git -C /opt/src/slime-ascend fetch --depth 1 origin 8451c245c2cddadbe9883cfbcc3c0d2ae007524f \
    && git -C /opt/src/slime-ascend checkout --detach 8451c245c2cddadbe9883cfbcc3c0d2ae007524f

# sgl-kernel-npu-glm53
RUN git clone --no-checkout --depth 1 https://github.com/lihanwen7/sgl-kernel-npu-glm53.git /opt/src/sgl-kernel-npu-src \
    && git -C /opt/src/sgl-kernel-npu-src fetch --depth 1 origin a906fe17d711df8b753e22551635de0a428f8b90 \
    && git -C /opt/src/sgl-kernel-npu-src checkout --detach a906fe17d711df8b753e22551635de0a428f8b90

# sglang-glm53-npu
RUN git clone --no-checkout --depth 1 https://github.com/lihanwen7/sglang-glm53-npu.git /opt/src/sglang \
    && git -C /opt/src/sglang fetch --depth 1 origin ec617fb315d2d8b7f1ab6152eb99ea07bcaa4f5f \
    && git -C /opt/src/sglang checkout --detach ec617fb315d2d8b7f1ab6152eb99ea07bcaa4f5f

# Megatron-LM-glm53-npu
RUN git clone --no-checkout --depth 1 https://github.com/lihanwen7/Megatron-LM-glm53-npu.git /opt/src/Megatron-LM \
    && git -C /opt/src/Megatron-LM fetch --depth 1 origin 2715c3d1b86dc04f48c7375bfd3736ecb2fabfee \
    && git -C /opt/src/Megatron-LM checkout --detach 2715c3d1b86dc04f48c7375bfd3736ecb2fabfee

# MegatronAdaptor
RUN git clone --no-checkout --depth 1 https://gitcode.com/Ascend/MegatronAdaptor.git /opt/src/MegatronAdaptor \
    && git -C /opt/src/MegatronAdaptor fetch --depth 1 origin f710cd34ed54eca6b7b7ae1b51a19840d15aedbc \
    && git -C /opt/src/MegatronAdaptor checkout --detach f710cd34ed54eca6b7b7ae1b51a19840d15aedbc

# TransformerEngineNPU
RUN git clone --no-checkout --depth 1 https://gitcode.com/Ascend/TransformerEngineNPU.git /opt/src/TransformerEngineNPU \
    && git -C /opt/src/TransformerEngineNPU fetch --depth 1 origin fd09a928c1e2c74fa13f08dd96a9d7c68cabb48f \
    && git -C /opt/src/TransformerEngineNPU checkout --detach fd09a928c1e2c74fa13f08dd96a9d7c68cabb48f

# flash-linear-attention-npu
RUN git clone --no-checkout --depth 1 https://github.com/flashserve/flash-linear-attention-npu /opt/src/flash-linear-attention-npu \
    && git -C /opt/src/flash-linear-attention-npu fetch --depth 1 origin bde95747b4f5d259d8b1a038cb6fb9b5e450cc32 \
    && git -C /opt/src/flash-linear-attention-npu checkout --detach bde95747b4f5d259d8b1a038cb6fb9b5e450cc32

# slime-glm53-npu
RUN git clone --no-checkout --depth 1 https://github.com/lihanwen7/slime-glm53-npu.git /opt/src/slime-ascend/slime \
    && git -C /opt/src/slime-ascend/slime fetch --depth 1 origin 161106e09b5369598fa5f9b163c456a11bfe55c5 \
    && git -C /opt/src/slime-ascend/slime checkout --detach 161106e09b5369598fa5f9b163c456a11bfe55c5

# cann-custom-ops/src/cann-recipes-infer
RUN git clone --no-checkout --depth 1 https://gitcode.com/cann/cann-recipes-infer.git /opt/src/cann-custom-ops/src/cann-recipes-infer \
    && git -C /opt/src/cann-custom-ops/src/cann-recipes-infer fetch --depth 1 origin 35a476c2b1ea61990380a7115ea991023aedc7d0 \
    && git -C /opt/src/cann-custom-ops/src/cann-recipes-infer checkout --detach 35a476c2b1ea61990380a7115ea991023aedc7d0

# cann-custom-ops/src/ops-transformer
RUN git clone --no-checkout --depth 1 https://github.com/lihanwen7/ops-transformer-glm53-npu.git /opt/src/cann-custom-ops/src/ops-transformer \
    && git -C /opt/src/cann-custom-ops/src/ops-transformer fetch --depth 1 origin 967671f27659345f5ccc06f40a7b8219bfeda09b \
    && git -C /opt/src/cann-custom-ops/src/ops-transformer checkout --detach 967671f27659345f5ccc06f40a7b8219bfeda09b

RUN python -m pip install --no-cache-dir pip==26.2.1 setuptools==84.0.0 wheel==0.48.0 packaging==26.3 ninja==1.13.2 \
    && python -m pip install --no-cache-dir \
        torch==2.10.0 torch_npu==2.10.0.post7 torchvision==0.25.0 \
        numpy==1.26.4 triton==3.5.0 triton_ascend==3.2.2 \
        --extra-index-url https://mirrors.huaweicloud.com/ascend/repos/pypi

# ============================================================================
# 6. Inference: compile both CANN projects, all three SGL packages and FLA A3
# ============================================================================
FROM toolchain AS inference
RUN python -m pip install --no-cache-dir build pybind11 pyyaml scipy attrs decorator psutil
WORKDIR /opt/src/cann-custom-ops/src/cann-recipes-infer/ops/ascendc
RUN bash build.sh \
    && set -- output/*.run && test "$#" = 1 && test -f "$1" \
    && bash "$1" --quiet --install-path="$ASCEND_OPP_PATH" \
    && source "$ASCEND_OPP_PATH/vendors/customize/bin/set_env.bash" \
    && USE_NINJA=1 python -m pip wheel --no-build-isolation --no-deps ./torch_ops_extension --wheel-dir /opt/wheels/cann-recipes \
    && python -m pip install --no-deps /opt/wheels/cann-recipes/*.whl

WORKDIR /opt/src/cann-custom-ops/src/ops-transformer
# Declare build arguments again where consumed, including with Docker 18.09.
ARG BUILD_JOBS=32
ARG OPS_BUILD_JOBS=64
# Build mHC and SMLA forward/backward plus their metadata operators for A3.
# This private commit has the unmodified upstream 648d75322b53 tree.
ARG TRANSFORMER_OPS=mhc_pre_sinkhorn,mhc_pre_sinkhorn_backward,mhc_post,mhc_post_backward,sparse_flash_mla,sparse_flash_mla_grad,sparse_flash_mla_metadata,sparse_flash_mla_grad_metadata
RUN git submodule update --init --recursive \
    && python -m pip install --no-cache-dir -r requirements.txt \
    && jobs="${OPS_BUILD_JOBS:-${BUILD_JOBS:-32}}" \
    && printf 'Ops Transformer build jobs: %s\n' "$jobs" \
    && test "$jobs" -gt 0 \
    && export MAX_JOBS="$jobs" CMAKE_BUILD_PARALLEL_LEVEL="$jobs" MAKEFLAGS="-j$jobs" \
    && bash build.sh --pkg --soc=ascend910_93 --ops="$TRANSFORMER_OPS" --vendor_name=custom --package-path "$ASCEND_HOME_PATH" -j"$jobs" \
    && set -- build_out/*.run && test "$#" = 1 && test -f "$1" \
    && bash "$1" --quiet --install-path="$ASCEND_OPP_PATH" \
    && source "$ASCEND_OPP_PATH/vendors/custom_transformer/bin/set_env.bash" \
    && bash build.sh --torch_extension --ops="$TRANSFORMER_OPS" --vendor_name=custom \
    && set -- torch_extension/dist/cann_ops_transformer_custom-*.whl && test "$#" = 1 && test -f "$1" \
    && mkdir -p /opt/wheels/ops-transformer \
    && cp "$1" /opt/wheels/ops-transformer/ \
    && python -m pip install --no-deps /opt/wheels/ops-transformer/cann_ops_transformer_custom-*.whl \
    && for op in mhc_pre_sinkhorn mhc_pre_sinkhorn_backward mhc_post mhc_post_backward sparse_flash_mla sparse_flash_mla_grad; do \
           test -d "$ASCEND_OPP_PATH/vendors/custom_transformer/op_impl/ai_core/tbe/kernel/ascend910_93/$op" || exit 1; \
       done

# Source-build exactly these three packages; no prebuilt fallback.
WORKDIR /opt/src/sgl-kernel-npu-src
RUN git submodule update --init --recursive \
    && bash build.sh Ascend910_9382 \
    && for name in sgl_kernel_npu torch_memory_saver deep_ep; do \
           set -- output/${name}-*.whl; test "$#" = 1 && test -f "$1" || exit 1; \
       done \
    && python -m pip install --no-deps output/sgl_kernel_npu-*.whl output/torch_memory_saver-*.whl output/deep_ep-*.whl

# FLA-NPU >=26.10.0 is required for this A3 training stack.
WORKDIR /opt/src/flash-linear-attention-npu
RUN python -m pip install --no-cache-dir -r requirements.txt \
    && python scripts/check_npu_env.py --build-only \
    && FLA_NPU_SOC=ascend910_93 python scripts/build_wheel.py \
    && python -m pip install --no-deps dist/flash_linear_attention_npu_a3-*.whl \
    && python scripts/check_packaged_wheel_api.py \
    && python -c 'from importlib.metadata import version; from packaging.version import Version; assert Version(version("flash-linear-attention-npu-a3")) >= Version("26.10.0")'

RUN python -m pip install --no-cache-dir setuptools-scm \
    && python -m pip install --no-build-isolation -e /opt/src/sglang/python \
    && python -m pip install sglang-router==0.3.2

# ============================================================================
# 7. Training backend: Megatron and Ascend adapters, without CUDA TE packages
# ============================================================================
FROM inference AS training-backend
RUN python -m pip install --no-cache-dir einops psutil pyyaml packaging typing_extensions nvdlfw-inspect \
    && python -m pip install --no-build-isolation --no-deps -e /opt/src/Megatron-LM \
    && python -m pip install --no-build-isolation --no-deps -e /opt/src/MegatronAdaptor \
    && python -m pip install --no-build-isolation --no-deps -e /opt/src/TransformerEngineNPU

# ============================================================================
# 8. Framework: Slime from the user fork. Rust is only a build prerequisite.
# ============================================================================
FROM training-backend AS runtime
ARG RUST_VERSION=1.90.0
ENV CARGO_HOME=/opt/cargo RUSTUP_HOME=/opt/rustup \
    CARGO_HTTP_CAINFO=/etc/pki/tls/certs/ca-bundle.crt \
    SSL_CERT_FILE=/etc/pki/tls/certs/ca-bundle.crt \
    PATH=/opt/cargo/bin:${PATH}
RUN curl --proto '=https' --tlsv1.2 -fsSL --retry 3 https://sh.rustup.rs -o /tmp/install-rustup.sh \
    && RUSTUP_INIT_SKIP_PATH_CHECK=yes sh /tmp/install-rustup.sh -y --profile minimal --default-toolchain "$RUST_VERSION" --no-modify-path \
    && rustc --version && cargo --version && rm -f /tmp/install-rustup.sh
RUN python -m pip install --no-cache-dir straw-queue==0.1.3 \
    && python -m pip install --no-build-isolation -e /opt/src/slime-ascend/slime

# CANN SDK tools share PYTHONPATH, so satisfy their declared Python dependencies.
RUN python -m pip install --no-cache-dir \
        colorlog==6.12.0 \
        contourpy==1.3.3 \
        cycler==0.12.1 \
        fonttools==4.68.0 \
        googleapis-common-protos==1.75.5 \
        kiwisolver==1.5.1 \
        matplotlib==3.11.2 \
        msguard==0.0.8 \
        narwhals==2.28.0 \
        opentelemetry-exporter-http-transport==0.66b1 \
        opentelemetry-exporter-otlp-common==0.66b1 \
        opentelemetry-exporter-otlp-proto-common==1.45.1 \
        opentelemetry-exporter-otlp-proto-grpc==1.45.1 \
        opentelemetry-exporter-otlp-proto-http==1.45.1 \
        opentelemetry-proto==1.45.1 \
        opentelemetry-sdk==1.45.1 \
        opentelemetry-semantic-conventions==0.66b1 \
        plotly==7.1.0 \
        pyparsing==3.3.3

# DeepEP's own API imports the extension at top level; preserve its compiled binary.
RUN site=$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))') \
    && set -- "$site"/deep_ep/deep_ep_cpp.cpython*.so \
    && test "$#" = 1 && test -f "$1" \
    && ln -s "deep_ep/${1##*/}" "$site/${1##*/}"

# Compile NPU operator Python/C++ bindings during image build.
ENV TORCH_EXTENSIONS_DIR=/opt/torch-extensions
RUN python -c 'from cann_ops_transformer.ops import mhc_pre_sinkhorn, mhc_pre_sinkhorn_backward, mhc_post, mhc_post_backward, sparse_flash_mla, sparse_flash_mla_grad' \
    && python -m pip check \
    && python -m pip freeze > /opt/installed-versions.txt

# Default environment for the user's training commands; no model/data is baked in.
ENV SLIME_ACCELERATOR=npu SGLANG_RUST_BUILD_MODE=never \
    PYTHONPATH=/opt/src/slime-ascend/scripts/lib/glm53/runtime:/opt/src/slime-ascend/slime:/opt/src/Megatron-LM:/opt/src/MegatronAdaptor:/opt/src/TransformerEngineNPU:/opt/src/sglang/python:${PYTHONPATH}
WORKDIR /opt/src/slime-ascend/slime
ENTRYPOINT ["/usr/local/bin/ascend-entrypoint"]
CMD ["bash"]
