import assert from "node:assert/strict";
import test from "node:test";

import { resolvePokeToken } from "../src/poke-auth.js";

test("POKE_API_KEY takes precedence over login token", () => {
  assert.equal(resolvePokeToken({ env: { POKE_API_KEY: "from-env" }, token: "from-login" }), "from-env");
});

test("login token is used when POKE_API_KEY is not set", () => {
  assert.equal(resolvePokeToken({ env: {}, token: "from-login" }), "from-login");
});

test("missing env and login token resolves to undefined", () => {
  assert.equal(resolvePokeToken({ env: {}, token: undefined }), undefined);
});
