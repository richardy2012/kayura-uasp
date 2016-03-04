/**
 * Copyright 2015-2016 the original author or authors.
 * HomePage: http://www.kayura.org
 */
package org.kayura.serializer;

import java.io.IOException;

import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.JsonSerializer;
import org.codehaus.jackson.map.SerializerProvider;

/**
 * FileSizeJsonSerializer
 *
 * @author liangxia@live.com
 */
public class FileSizeJsonSerializer extends JsonSerializer<Long> {

	@Override
	public void serialize(Long size, JsonGenerator gen, SerializerProvider provider)
			throws IOException, JsonProcessingException {

		long kb = 1024;
		long mb = kb * 1024;
		long gb = mb * 1024;

		String result = size.toString();

		if (size >= gb) {
			result = String.format("%.1f GB", (float) size / gb);
		} else if (size >= mb) {
			float f = (float) size / mb;
			result = String.format(f > 100 ? "%.0f MB" : "%.1f MB", f);
		} else if (size >= kb) {
			float f = (float) size / kb;
			result = String.format(f > 100 ? "%.0f KB" : "%.1f KB", f);
		} else
			result = String.format("%d B", size);

		gen.writeString(result);
	}

}
