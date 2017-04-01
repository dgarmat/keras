

#' Max pooling operation for temporal data.
#' 
#' @inheritParams layer_dense
#'   
#' @param pool_size Integer, size of the max pooling windows.
#' @param strides Integer, or NULL. Factor by which to downscale. E.g. 2 will
#'   halve the input. If NULL, it will default to `pool_size`.
#' @param padding One of `"valid"` or `"same"` (case-insensitive).
#'   
#' @section Input shape: 3D tensor with shape: `(batch_size, steps, features)`.
#'   
#' @section Output shape: 3D tensor with shape: `(batch_size, downsampled_steps,
#'   features)`.
#'  
#' @family pooling layers
#'     
#' @export
layer_max_pooling_1d <- function(x, pool_size = 2L, strides = NULL, padding = "valid") {
  
  call_layer(tf$contrib$keras$layers$MaxPooling1D, x, list(
    pool_size = as.integer(pool_size),
    strides = as_nullable_integer(strides),
    padding = padding
  ))
}



#' Max pooling operation for spatial data.
#' 
#' @inheritParams layer_max_pooling_1d
#'   
#' @param pool_size integer or list of 2 integers, factors by which to downscale
#'   (vertical, horizontal). (2, 2) will halve the input in both spatial
#'   dimension. If only one integer is specified, the same window length will be
#'   used for both dimensions.
#' @param strides Integer, list of 2 integers, or NULL. Strides values. If NULL,
#'   it will default to `pool_size`.
#' @param padding One of `"valid"` or `"same"` (case-insensitive).
#' @param data_format A string, one of `channels_last` (default) or
#'   `channels_first`. The ordering of the dimensions in the inputs.
#'   `channels_last` corresponds to inputs with shape `(batch, width, height,
#'   channels)` while `channels_first` corresponds to inputs with shape `(batch,
#'   channels, width, height)`. It defaults to the `image_data_format` value
#'   found in your Keras config file at `~/.keras/keras.json`. If you never set
#'   it, then it will be "channels_last".
#'   
#' @section Input shape: 
#' - If `data_format='channels_last'`: 4D tensor with shape: `(batch_size, rows, cols, channels)` 
#' - If `data_format='channels_first'`: 4D tensor with shape: `(batch_size, channels, rows, cols)`
#'   
#' @section Output shape: 
#' - If `data_format='channels_last'`: 4D tensor with shape: `(batch_size, pooled_rows, pooled_cols, channels)` 
#' - If `data_format='channels_first'`: 4D tensor with shape: `(batch_size, channels, pooled_rows, pooled_cols)`
#' 
#' @family pooling layers
#'       
#' @export
layer_max_pooling_2d <- function(x, pool_size = c(2L, 2L), strides = NULL, padding = "valid", data_format = NULL) {
  
  call_layer(tf$contrib$keras$layers$MaxPooling2D, x, list(
    pool_size = as.integer(pool_size),
    strides = as_nullable_integer(strides),
    padding = padding,
    data_format = data_format
  ))
  
}


#' Max pooling operation for 3D data (spatial or spatio-temporal).
#' 
#' @inheritParams layer_max_pooling_1d
#'   
#' @param pool_size list of 3 integers, factors by which to downscale (dim1,
#'   dim2, dim3). (2, 2, 2) will halve the size of the 3D input in each
#'   dimension.
#' @param strides list of 3 integers, or NULL. Strides values.
#' @param padding One of `"valid"` or `"same"` (case-insensitive).
#' @param data_format A string, one of `channels_last` (default) or
#'   `channels_first`. The ordering of the dimensions in the inputs.
#'   `channels_last` corresponds to inputs with shape `(batch, spatial_dim1,
#'   spatial_dim2, spatial_dim3, channels)` while `channels_first` corresponds
#'   to inputs with shape `(batch, channels, spatial_dim1, spatial_dim2,
#'   spatial_dim3)`. It defaults to the `image_data_format` value found in your
#'   Keras config file at `~/.keras/keras.json`. If you never set it, then it
#'   will be "channels_last".
#'   
#' @section Input shape: 
#' - If `data_format='channels_last'`: 5D tensor with shape: `(batch_size, spatial_dim1, spatial_dim2, spatial_dim3, channels)` 
#' - If `data_format='channels_first'`: 5D tensor with shape: `(batch_size, channels, spatial_dim1, spatial_dim2, spatial_dim3)`
#'   
#' @section Output shape: 
#' - If `data_format='channels_last'`: 5D tensor with shape: `(batch_size, pooled_dim1, pooled_dim2, pooled_dim3, channels)` 
#' - If `data_format='channels_first'`: 5D tensor with shape: `(batch_size, channels, pooled_dim1, pooled_dim2, pooled_dim3)`
#'   
#' @family pooling layers
#'   
#' @export
layer_max_pooling_3d <- function(x, pool_size = c(2L, 2L, 2L), strides = NULL, padding = "valid", data_format = NULL) {
  
  call_layer(tf$contrib$keras$layers$MaxPooling3D, x, list(
    pool_size = as.integer(pool_size),
    strides = as_nullable_integer(strides),
    padding = padding,
    data_format = data_format
  ))
  
}


#' Average pooling for temporal data.
#' 
#' @inheritParams layer_max_pooling_1d
#'   
#' @param pool_size Integer, size of the max pooling windows.
#' @param strides Integer, or NULL. Factor by which to downscale. E.g. 2 will
#'   halve the input. If NULL, it will default to `pool_size`.
#' @param padding One of `"valid"` or `"same"` (case-insensitive).
#'   
#' @section Input shape: 3D tensor with shape: `(batch_size, steps, features)`.
#'   
#' @section Output shape: 3D tensor with shape: `(batch_size, downsampled_steps,
#'   features)`.
#'  
#' @family pooling layers
#'     
#' @export
layer_average_pooling_1d <- function(x, pool_size = 2L, strides = NULL, padding = "valid") {
  
  call_layer(tf$contrib$keras$layers$AveragePooling1D, x, list(
    pool_size = as.integer(pool_size),
    strides = as_nullable_integer(strides),
    padding = padding
  ))
  
}

#' Average pooling operation for spatial data.
#' 
#' @inheritParams layer_average_pooling_1d
#'   
#' @param pool_size integer or list of 2 integers, factors by which to downscale
#'   (vertical, horizontal). (2, 2) will halve the input in both spatial
#'   dimension. If only one integer is specified, the same window length will be
#'   used for both dimensions.
#' @param strides Integer, list of 2 integers, or NULL. Strides values. If NULL,
#'   it will default to `pool_size`.
#' @param padding One of `"valid"` or `"same"` (case-insensitive).
#' @param data_format A string, one of `channels_last` (default) or
#'   `channels_first`. The ordering of the dimensions in the inputs.
#'   `channels_last` corresponds to inputs with shape `(batch, width, height,
#'   channels)` while `channels_first` corresponds to inputs with shape `(batch,
#'   channels, width, height)`. It defaults to the `image_data_format` value
#'   found in your Keras config file at `~/.keras/keras.json`. If you never set
#'   it, then it will be "channels_last".
#'   
#' @section Input shape: 
#' - If `data_format='channels_last'`: 4D tensor with shape: `(batch_size, rows, cols, channels)` 
#' - If `data_format='channels_first'`: 4D tensor with shape: `(batch_size, channels, rows, cols)`
#'   
#' @section Output shape: 
#' - If `data_format='channels_last'`: 4D tensor with shape: `(batch_size, pooled_rows, pooled_cols, channels)` 
#' - If `data_format='channels_first'`: 4D tensor with shape: `(batch_size, channels, pooled_rows, pooled_cols)`
#'  
#' @family pooling layers 
#'   
#' @export
layer_average_pooling_2d <- function(x, pool_size = c(2L, 2L), strides = NULL, padding = "valid", data_format = NULL) {
  
  call_layer(tf$contrib$keras$layers$AveragePooling2D, x, list(
    pool_size = as.integer(pool_size),
    strides = as_nullable_integer(strides),
    padding = padding,
    data_format = data_format
  ))
  
}

#' Average pooling operation for 3D data (spatial or spatio-temporal).
#' 
#' @inheritParams layer_average_pooling_1d
#' 
#' @param pool_size list of 3 integers, factors by which to downscale (dim1,
#'   dim2, dim3). (2, 2, 2) will halve the size of the 3D input in each
#'   dimension.
#' @param strides list of 3 integers, or NULL. Strides values.
#' @param padding One of `"valid"` or `"same"` (case-insensitive).
#' @param data_format A string, one of `channels_last` (default) or
#'   `channels_first`. The ordering of the dimensions in the inputs.
#'   `channels_last` corresponds to inputs with shape `(batch, spatial_dim1,
#'   spatial_dim2, spatial_dim3, channels)` while `channels_first` corresponds
#'   to inputs with shape `(batch, channels, spatial_dim1, spatial_dim2,
#'   spatial_dim3)`. It defaults to the `image_data_format` value found in your
#'   Keras config file at `~/.keras/keras.json`. If you never set it, then it
#'   will be "channels_last".
#'   
#' @section Input shape: 
#' - If `data_format='channels_last'`: 5D tensor with shape: `(batch_size, spatial_dim1, spatial_dim2, spatial_dim3, channels)` 
#' - If `data_format='channels_first'`: 5D tensor with shape: `(batch_size, channels, spatial_dim1, spatial_dim2, spatial_dim3)`
#'   
#' @section Output shape: 
#' - If `data_format='channels_last'`: 5D tensor with shape: `(batch_size, pooled_dim1, pooled_dim2, pooled_dim3, channels)` 
#' - If `data_format='channels_first'`: 5D tensor with shape: `(batch_size, channels, pooled_dim1, pooled_dim2, pooled_dim3)`
#' 
#' @family pooling layers
#'       
#' @export
layer_average_pooling_3d <- function(x, pool_size = c(2L, 2L, 2L), strides = NULL, padding = "valid", data_format = NULL) {
  call_layer(tf$contrib$keras$layers$AveragePooling3D, x, list(
    pool_size = as.integer(pool_size),
    strides = as_nullable_integer(strides),
    padding = padding,
    data_format = data_format
  ))
  
}


#' Global max pooling operation for temporal data.
#' 
#' @inheritParams layer_dense
#' 
#' @section Input shape:
#' 3D tensor with shape: `(batch_size, steps, features)`.
#' 
#' @section Output shape:
#' 2D tensor with shape: `(batch_size, channels)`
#' 
#' @family pooling layers
#' 
#' @export
layer_global_max_pooling_1d <- function(x) {
  call_layer(tf$contrib$keras$layers$GlobalMaxPooling1D, x, list())
}

#' Global average pooling operation for temporal data.
#' 
#' @inheritParams layer_global_max_pooling_1d
#' 
#' @section Input shape:
#' 3D tensor with shape: `(batch_size, steps, features)`.
#' 
#' @section Output shape:
#' 2D tensor with shape: `(batch_size, channels)`
#' 
#' @family pooling layers
#' 
#' @export
layer_global_average_pooling_1d <- function(x) {
  call_layer(tf$contrib$keras$layers$GlobalAveragePooling1D, x, list())
}


#' Global max pooling operation for spatial data.
#' 
#' @inheritParams layer_global_max_pooling_1d
#' 
#' @param data_format A string, one of `channels_last` (default) or
#'   `channels_first`. The ordering of the dimensions in the inputs.
#'   `channels_last` corresponds to inputs with shape `(batch, width, height,
#'   channels)` while `channels_first` corresponds to inputs with shape `(batch,
#'   channels, width, height)`. It defaults to the `image_data_format` value
#'   found in your Keras config file at `~/.keras/keras.json`. If you never set
#'   it, then it will be "channels_last".
#'   
#' @section Input shape: 
#' - If `data_format='channels_last'`: 4D tensor with shape: `(batch_size, rows, cols, channels)` 
#' - If `data_format='channels_first'`: 4D tensor with shape: `(batch_size, channels, rows, cols)`
#'   
#' @section Output shape: 2D tensor with shape: `(batch_size, channels)`
#'  
#' @family pooling layers
#'     
#' @export
layer_global_max_pooling_2d <- function(x, data_format = NULL) {
  call_layer(tf$contrib$keras$layers$GlobalMaxPooling2D, x, list(
    data_format = data_format
  ))
}

#' Global average pooling operation for spatial data.
#' 
#' @inheritParams layer_global_average_pooling_1d
#' 
#' @param data_format A string, one of `channels_last` (default) or
#'   `channels_first`. The ordering of the dimensions in the inputs.
#'   `channels_last` corresponds to inputs with shape `(batch, width, height,
#'   channels)` while `channels_first` corresponds to inputs with shape `(batch,
#'   channels, width, height)`. It defaults to the `image_data_format` value
#'   found in your Keras config file at `~/.keras/keras.json`. If you never set
#'   it, then it will be "channels_last".
#'   
#' @section Input shape: 
#' - If `data_format='channels_last'`: 4D tensor with shape: `(batch_size, rows, cols, channels)` 
#' - If `data_format='channels_first'`: 4D tensor with shape: `(batch_size, channels, rows, cols)`
#'   
#' @section Output shape: 2D tensor with shape: `(batch_size, channels)`
#'  
#' @family pooling layers
#'     
#' @export
layer_global_average_pooling_2d <- function(x, data_format = NULL) {
  call_layer(tf$contrib$keras$layers$GlobalAveragePooling2D, x, list(
    data_format = data_format
  ))
}


#' Global Max pooling operation for 3D data.
#' 
#' @inheritParams layer_global_max_pooling_2d
#'   
#' @param data_format A string, one of `channels_last` (default) or
#'   `channels_first`. The ordering of the dimensions in the inputs.
#'   `channels_last` corresponds to inputs with shape `(batch, spatial_dim1,
#'   spatial_dim2, spatial_dim3, channels)` while `channels_first` corresponds
#'   to inputs with shape `(batch, channels, spatial_dim1, spatial_dim2,
#'   spatial_dim3)`. It defaults to the `image_data_format` value found in your
#'   Keras config file at `~/.keras/keras.json`. If you never set it, then it
#'   will be "channels_last".
#'   
#' @section Input shape: 
#' - If `data_format='channels_last'`: 5D tensor with shape: `(batch_size, spatial_dim1, spatial_dim2, spatial_dim3, channels)` 
#' - If `data_format='channels_first'`: 5D tensor with shape: `(batch_size, channels, spatial_dim1, spatial_dim2, spatial_dim3)`
#'   
#' @section Output shape: 2D tensor with shape: `(batch_size, channels)`
#'
#' @family pooling layers
#'         
#' @export
layer_global_max_pooling_3d <- function(x, data_format = NULL) {
  call_layer(tf$contrib$keras$layers$GlobalMaxPooling3D, x, list(
    data_format = data_format
  ))
}

#' Global Average pooling operation for 3D data.
#' 
#' @inheritParams layer_global_average_pooling_2d
#'   
#' @param data_format A string, one of `channels_last` (default) or
#'   `channels_first`. The ordering of the dimensions in the inputs.
#'   `channels_last` corresponds to inputs with shape `(batch, spatial_dim1,
#'   spatial_dim2, spatial_dim3, channels)` while `channels_first` corresponds
#'   to inputs with shape `(batch, channels, spatial_dim1, spatial_dim2,
#'   spatial_dim3)`. It defaults to the `image_data_format` value found in your
#'   Keras config file at `~/.keras/keras.json`. If you never set it, then it
#'   will be "channels_last".
#'   
#' @section Input shape: 
#' - If `data_format='channels_last'`: 5D tensor with shape: `(batch_size, spatial_dim1, spatial_dim2, spatial_dim3, channels)` 
#' - If `data_format='channels_first'`: 5D tensor with shape: `(batch_size, channels, spatial_dim1, spatial_dim2, spatial_dim3)`
#'   
#' @section Output shape: 2D tensor with shape: `(batch_size, channels)`
#' 
#' @family pooling layers
#'       
#' @export
layer_global_average_pooling_3d <- function(x, data_format = NULL) {
  call_layer(tf$contrib$keras$layers$GlobalAveragePooling3D, x, list(
    data_format = data_format
  ))
}

