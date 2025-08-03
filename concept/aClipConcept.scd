(
~thres = 0.1;
~makeup = 4.0;

b = Buffer.read(s, "/home/amsakan/dev/aClip/concept/huh.wav");

b.loadToFloatArray(action: { |array|
	for(0, array.size - 1, { |i|
		if(array[i] >= ~thres, {
			array[i] = ~thres;
		});

		array[i] = array[i] * ~makeup;
	});

	b.loadCollection(array);
});

x = {PlayBuf.ar(2, b, BufRateScale.kr(b), doneAction: 2)}.play;
)