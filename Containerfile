ARG RHCOS_VER
FROM ${RHCOS_VER}
RUN rpm-ostree override replace  http://localhost/patch/kernel-{,core-,modules-,modules-core-,modules-extra-}5.14.0-332.bisect_v12_good.el9_4.x86_64.rpm && \
    rpm-ostree cleanup -m && \
    ostree container commit
