# Doppler mutliline secrets issue test

Create test Doppler project and get service token to add to GitHub:

```sh
make doppler-project
```

Generate a key using the Ed25519 algorithm which produces the "Load key "id_rsa": invalid format" error and create new `SSH_KEY` secret:

```sh
make gen-key
```

Run the [Test SSH key Action](https://github.com/DopplerTest/newlines-issue/actions/workflows/test-ssh-key.yml) and observe that the initial key verification fails but passes once dos2unix is used.

Now set `SSH_KEY` using the CLI:

```sh
make set-key-cli
```

Rr-run the [Test SSH key Action](https://github.com/DopplerTest/newlines-issue/actions/workflows/test-ssh-key.yml) and observe that the initial key verification now passes.
