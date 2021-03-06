library(data.table)
setwd("/Users/mark/Documents/icdm15/")
# cats<-fread("property_categories.csv")
# dense_properties<-dcast(cats,property_id ~ category_id,drop=FALSE,fill=0,fun.aggregate=length)
# rm(cats)
dense_properties<-fread("dense_properties.csv")
id_props<-fread("id_properties.csv")
id_props[device_or_cookie_indicator==0,device_or_cookie_id:=paste0("D",device_or_cookie_id)]
id_props[,device_or_cookie_indicator:=NULL]
setnames(id_props,c("myKey","property_id","days"))
cuts<-100
jStart<-3
jEnd<-100
byKey<-list()
for(j in jStart:jEnd){
  size<-nrow(id_props)/cuts
  a<-1+round((j-1)*size,0)
  b<-round(size*j,0)
  start<-Sys.time()
  print(paste("Merge:", j, Sys.time()))
  processed<-merge(id_props[a:b,],dense_properties,by="property_id",all.x=TRUE)
  print(paste("Distribute:", j, Sys.time()))
  distribute<-processed$days*processed[,4:ncol(processed),with=FALSE]
  distribute[,myKey:=processed[,myKey]]
  print(paste("Reduce:", j, Sys.time()))
  local<-distribute[,.(sum(category_1),sum(category_10),sum(category_100),sum(category_101),sum(category_102),sum(category_103),sum(category_104),sum(category_105),sum(category_106),sum(category_107),sum(category_108),sum(category_109),sum(category_11),sum(category_110),sum(category_111),sum(category_112),sum(category_113),sum(category_114),sum(category_115),sum(category_116),sum(category_117),sum(category_118),sum(category_119),sum(category_12),sum(category_120),sum(category_121),sum(category_122),sum(category_123),sum(category_124),sum(category_125),sum(category_126),sum(category_127),sum(category_128),sum(category_129),sum(category_13),sum(category_130),sum(category_131),sum(category_132),sum(category_133),sum(category_134),sum(category_135),sum(category_136),sum(category_137),sum(category_138),sum(category_139),sum(category_14),sum(category_140),sum(category_141),sum(category_142),sum(category_143),sum(category_144),sum(category_145),sum(category_146),sum(category_147),sum(category_148),sum(category_149),sum(category_15),sum(category_150),sum(category_151),sum(category_152),sum(category_153),sum(category_154),sum(category_155),sum(category_156),
                        sum(category_157),sum(category_158),sum(category_159),sum(category_16),sum(category_160),sum(category_161),sum(category_162),sum(category_163),sum(category_164),sum(category_165),sum(category_166),sum(category_167),sum(category_168),sum(category_169),sum(category_17),sum(category_170),sum(category_171),sum(category_172),sum(category_173),sum(category_174),sum(category_175),sum(category_176),sum(category_177),sum(category_178),sum(category_179),sum(category_18),sum(category_180),sum(category_181),sum(category_182),sum(category_183),sum(category_184),sum(category_185),sum(category_186),sum(category_187),sum(category_188),sum(category_189),sum(category_19),sum(category_190),sum(category_191),sum(category_192),sum(category_193),sum(category_194),sum(category_195),sum(category_196),sum(category_197),sum(category_198),sum(category_199),sum(category_2),sum(category_20),sum(category_200),sum(category_201),sum(category_202),sum(category_203),sum(category_204),sum(category_205),sum(category_206),sum(category_207),sum(category_208),sum(category_209),sum(category_21),sum(category_210),sum(category_211),sum(category_212),sum(category_213),
                        sum(category_214),sum(category_215),sum(category_216),sum(category_217),sum(category_218),sum(category_219),sum(category_22),sum(category_220),sum(category_221),sum(category_222),sum(category_223),sum(category_224),sum(category_225),sum(category_226),sum(category_227),sum(category_228),sum(category_229),sum(category_23),sum(category_230),sum(category_231),sum(category_232),sum(category_233),sum(category_234),sum(category_235),sum(category_236),sum(category_237),sum(category_238),sum(category_239),sum(category_24),sum(category_240),sum(category_241),sum(category_242),sum(category_243),sum(category_244),sum(category_245),sum(category_246),sum(category_247),sum(category_248),sum(category_249),sum(category_25),sum(category_250),sum(category_251),sum(category_252),sum(category_253),sum(category_254),sum(category_255),sum(category_256),sum(category_257),sum(category_258),sum(category_259),sum(category_26),sum(category_260),sum(category_261),sum(category_262),sum(category_263),sum(category_264),sum(category_265),sum(category_266),sum(category_267),sum(category_268),sum(category_269),sum(category_27),sum(category_270),sum(category_271),
                        sum(category_272),sum(category_273),sum(category_274),sum(category_275),sum(category_276),sum(category_277),sum(category_278),sum(category_279),sum(category_28),sum(category_280),sum(category_281),sum(category_282),sum(category_283),sum(category_284),sum(category_285),sum(category_286),sum(category_287),sum(category_288),sum(category_289),sum(category_29),sum(category_290),sum(category_291),sum(category_292),sum(category_293),sum(category_294),sum(category_295),sum(category_296),sum(category_297),sum(category_298),sum(category_299),sum(category_3),sum(category_30),sum(category_300),sum(category_301),sum(category_302),sum(category_303),sum(category_304),sum(category_305),sum(category_306),sum(category_307),sum(category_308),sum(category_309),sum(category_31),sum(category_310),sum(category_311),sum(category_312),sum(category_313),sum(category_314),sum(category_315),sum(category_316),sum(category_317),sum(category_318),sum(category_319),sum(category_32),sum(category_320),sum(category_321),sum(category_322),sum(category_323),sum(category_324),sum(category_325),sum(category_326),sum(category_327),sum(category_328),sum(category_329),
                        sum(category_33),sum(category_330),sum(category_331),sum(category_332),sum(category_333),sum(category_334),sum(category_335),sum(category_336),sum(category_337),sum(category_338),sum(category_339),sum(category_34),sum(category_340),sum(category_341),sum(category_342),sum(category_343),sum(category_344),sum(category_345),sum(category_346),sum(category_347),sum(category_348),sum(category_349),sum(category_35),sum(category_350),sum(category_351),sum(category_352),sum(category_353),sum(category_354),sum(category_355),sum(category_356),sum(category_357),sum(category_358),sum(category_359),sum(category_36),sum(category_360),sum(category_361),sum(category_362),sum(category_363),sum(category_364),sum(category_365),sum(category_366),sum(category_367),sum(category_368),sum(category_369),sum(category_37),sum(category_370),sum(category_371),sum(category_372),sum(category_373),sum(category_374),sum(category_375),sum(category_376),sum(category_377),sum(category_378),sum(category_379),sum(category_38),sum(category_380),sum(category_381),sum(category_382),sum(category_383),sum(category_384),sum(category_385),sum(category_386),sum(category_387),
                        sum(category_388),sum(category_389),sum(category_39),sum(category_390),sum(category_391),sum(category_392),sum(category_393),sum(category_394),sum(category_395),sum(category_396),sum(category_397),sum(category_398),sum(category_399),sum(category_4),sum(category_40),sum(category_400),sum(category_401),sum(category_402),sum(category_403),sum(category_404),sum(category_405),sum(category_406),sum(category_407),sum(category_408),sum(category_409),sum(category_41),sum(category_410),sum(category_411),sum(category_412),sum(category_413),sum(category_414),sum(category_415),sum(category_416),sum(category_417),sum(category_418),sum(category_419),sum(category_42),sum(category_420),sum(category_421),sum(category_422),sum(category_423),sum(category_424),sum(category_425),sum(category_426),sum(category_427),sum(category_428),sum(category_429),sum(category_43),sum(category_430),sum(category_431),sum(category_432),sum(category_433),sum(category_434),sum(category_435),sum(category_436),sum(category_437),sum(category_438),sum(category_439),sum(category_44),sum(category_440),sum(category_441),sum(category_442),sum(category_443),sum(category_45),
                        sum(category_46),sum(category_47),sum(category_48),sum(category_49),sum(category_5),sum(category_50),sum(category_51),sum(category_52),sum(category_53),sum(category_54),sum(category_55),sum(category_56),sum(category_57),sum(category_58),sum(category_59),sum(category_6),sum(category_60),sum(category_61),sum(category_62),sum(category_63),sum(category_64),sum(category_65),sum(category_66),sum(category_67),sum(category_68),sum(category_69),sum(category_7),sum(category_70),sum(category_71),sum(category_72),sum(category_73),sum(category_74),sum(category_75),sum(category_76),sum(category_77),sum(category_78),sum(category_79),sum(category_8),sum(category_80),sum(category_81),sum(category_82),sum(category_83),sum(category_84),sum(category_85),sum(category_86),sum(category_87),sum(category_88),sum(category_89),sum(category_9),sum(category_90),sum(category_91),sum(category_92),sum(category_93),sum(category_94),sum(category_95),sum(category_96),sum(category_97),sum(category_98),
                        sum(category_99)),myKey]
  print(paste("Loop completed:", j, Sys.time()))
  save(local,file=paste0("byKey_",j,".Rdata"))
  end<-Sys.time()
  print(paste("Total time, ",j,end-start))
  gc()
}
gc()
for(k in 1:2){print(dim(byKey[[k]]))}

## merge all the pieces; track which piece in case columns got skewed
rm(local)
load("byKey_1.Rdata")
local$i<-1
allKeys<-local
for(i in 2:100){
  load(paste0("byKey_",i,".Rdata"))
  local$i<-i
  allKeys<-rbind(allKeys,local)
  rm(local)
  print(paste(i,Sys.time()))
}
write.csv(allKeys,"device_categories.csv",row.names=FALSE)
