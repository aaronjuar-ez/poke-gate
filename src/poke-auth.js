import { getToken, isLoggedIn, login } from "poke";

export function resolvePokeToken(options = {}) {
  const { env = process.env } = options;
  const loginToken = Object.hasOwn(options, "token") ? options.token : getToken();
  return env.POKE_API_KEY || loginToken;
}

export function getPokeAuthToken() {
  return resolvePokeToken();
}

export async function ensurePokeAuthenticated({ onLogin } = {}) {
  if (!getPokeAuthToken() && !isLoggedIn()) {
    onLogin?.();
    await login();
  }

  const token = getPokeAuthToken();
  if (!token) {
    throw new Error("Authentication failed: no token returned by Poke SDK.");
  }

  return token;
}
