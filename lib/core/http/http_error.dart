enum HttpError {
  badRequest, // 400
  unauthorized, // 401
  forbidden, // 403
  notFound, // 404
  conflict, // 409
  unprocessable, // 422
  serverError, // 5xx
  network, // Falha de rede/timeout
  invalidData, // Body inválido (JSON inválido, etc.)
  unknown, // Qualquer outro
}
