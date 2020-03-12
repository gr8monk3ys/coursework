# Pareto

dpareto = function(x, shape, scale = 1, log = FALSE) {
  if (shape <= 0) {
    stop("shape should be strictly positive.")
  }
  if (scale <= 0) {
    stop("scale should be strictly positive.")
  }
  d = ifelse(x >= scale, shape/scale*(scale/x)^(shape+1), 0)
  if (log) d = log(d)
  return(d)
}

ppareto = function(x, shape, scale = 1, lower.tail = TRUE, log.p = FALSE) {
  if (shape <= 0) {
    stop("shape should be strictly positive.")
  }
  if (scale <= 0) {
    stop("scale should be strictly positive.")
  }
  p = ifelse(x >= scale, 1-(scale/x)^shape, 0)
  if (!lower.tail) p = 1-p
  if (log.p) p = log(p)
  return(p)
}

qpareto = function(p, shape, scale = 1, lower.tail = TRUE, log.p = FALSE) {
  if (shape <= 0) {
    stop("shape should be strictly positive.")
  }
  if (scale <= 0) {
    stop("scale should be strictly positive.")
  }
  if (log.p) p = exp(p)
  if (!lower.tail) p = 1-p
  if (all(p >= 0 & p <= 1)) {
    return(scale*(1-p)^(-1/shape))
  } else {
    stop("p should be between 0 and 1.")
  }
}

rpareto = function(n, shape, scale = 1) {
  if (shape <= 0) {
    stop("shape should be strictly positive.")
  }
  if (scale <= 0) {
    stop("scale should be strictly positive.")
  }
  return(qpareto(runif(n), scale=scale, shape=shape))
}
