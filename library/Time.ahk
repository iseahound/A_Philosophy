ConvertMSToHourMinSec(ms){
  return, floor(((ms / 1000) / 60 )/ 60) " hours "
        . floor(mod(((ms / 1000)/ 60), 60)) " minutes and "
        . floor(mod((ms / 1000), 60)) " seconds "
  ;     . floor(mod(ms, 1000)) " milliseconds "                ;No need for milliseconds
}