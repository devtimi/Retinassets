# Retinassets
A sample document-based application written in Xojo. The app will help build CSS for HiDPI image assets.

<img src="Mac_Screenshot.png" width="712" height="534" />

## Usage
* Click + / - to add or remove an asset
* Name the asset, this name becomes the div ID
* Define the size @1x
* Provide 1x and 2x sources
* Click Generate to write out the CSS

Assets where there isn't enough information to write the CSS will show red text in the list. These assets will also be skipped when generating the CSS. Custom CSS will be indented when generated.