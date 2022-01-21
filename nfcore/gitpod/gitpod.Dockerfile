FROM gitpod/workspace-full

USER root

# Install Conda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda && \
    rm Miniconda3-latest-Linux-x86_64.sh

ENV PATH="/opt/conda/bin:$PATH"

RUN chown -R gitpod:gitpod /opt/conda

USER gitpod

# Install nextflow, nf-core, Mamba, and pytest-workflow
RUN conda install nextflow nf-core pytest-workflow mamba -n base -c conda-forge -c bioconda && \
    nextflow self-update && \
    conda clean --all -f -y

