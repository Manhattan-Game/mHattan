stock FindModelIDForFlags(flags)
{
	flags &= 0xFFFFFFDF;
	
	new xx=0;
	while(xx!=68) {
		if(modelflags_flags[xx] == flags) return modelflags_index[xx];
		xx++;
	}
	return 19353;
}

stock AddVC2SASimpleObject(flags, newmodelid, dffpath[], txdpath[], timeon=0, timeoff=0)
{
	#if USE_ARTWORK == 1
		#if defined VC_MODEL_PREVIEW
			#pragma unused timeon, timeoff
			AddSimpleModel(-1, FindModelIDForFlags(flags), newmodelid, dffpath, txdpath);
		#else
			if(timeon == 0 && timeoff == 0) AddSimpleModel(-1, FindModelIDForFlags(flags), newmodelid, dffpath, txdpath);
			else AddSimpleModelTimed(-1, FindModelIDForFlags(flags), newmodelid, dffpath, txdpath, timeon, timeoff);
		#endif
	#else
		#pragma unused flags, newmodelid, dffpath, txdpath, timeon, timeoff
	#endif
	return 1;
}