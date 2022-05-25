# Map Tiler downloader
# Originally created to acquire map tiles for the AIATSIS Indigenous Map of Australia.
# Can be repurposed to download any MapTiler grid, if max width and height can be established

max_width <- 8
max_height <- 7
zoom <- 3
base_url <- paste0("https://aiatsis.gov.au/sites/default/files/maps/aiatsis_map/", zoom, "/")

dest_fold <- paste0("Map Grid ", zoom, "x")
dir.create(file.path(getwd(), dest_fold), showWarnings = FALSE)

x <- 0
y <- 0
tile_count <- 0

while (x <= max_width) {
  while (y <= max_height) {
    url <- paste0(base_url,x,"/",y,".png")
    dest <- paste0(dest_fold, "\\", x,"-",y, ".png")
    # Uncomment next line to process downloads
    download.file(url, destfile = dest , mode="wb")   
    y <- y + 1
    tile_count <- tile_count + 1
  }
  y <- 0
  x <- x + 1
}

#Check total amount of tiles
print(tile_count)
