//this file is part of MimeTools (plugin for Notepad++)
//Copyright (C)2013 Robert Meakins <rmeakins@users.sf.net>
//
//This program is free software; you can redistribute it and/or
//modify it under the terms of the GNU General Public License
//as published by the Free Software Foundation; either
//version 2 of the License, or (at your option) any later version.
//
//This program is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.
//
//You should have received a copy of the GNU General Public License
//along with this program; if not, write to the Free Software
//Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
module npp_mimetools.saml;


private static import npp_mimetools.b64;
private static import npp_mimetools.tinflate;
private static import npp_mimetools.url;

enum int SAML_DECODE_ERROR_URLDECODE = -1;
enum int SAML_DECODE_ERROR_BASE64DECODE = -2;
enum int SAML_DECODE_ERROR_INFLATE = -3;
enum int SAML_MESSAGE_MAX_SIZE = 200000;

nothrow
int samlDecode(ref char[] dest, const char[] encodedSamlStr)

	in
	{
		assert(dest.length != 0);
	}

	do
	{
		static import npp_mimetools.b64;
		static import npp_mimetools.tinflate;
		static import npp_mimetools.url;

		char[] pUrlDecodedText = new char[encodedSamlStr.length];

		dest[] = '\0';
		pUrlDecodedText[] = '\0';

		// URL Decode
		size_t urlDecodedLen = npp_mimetools.url.UrlToAscii(pUrlDecodedText, encodedSamlStr);

		if (urlDecodedLen < 0) {
			return .SAML_DECODE_ERROR_URLDECODE;
		}

		char[] base64DecodedText = new char[urlDecodedLen + 1];

		int base64DecodedLen = npp_mimetools.b64.base64Decode(base64DecodedText, pUrlDecodedText, urlDecodedLen, true, false);

		if (base64DecodedLen < 0) {
			return .SAML_DECODE_ERROR_BASE64DECODE;
		}

		base64DecodedText[base64DecodedLen] = '\0';

		// A SAML message should be longer than 10 chars
		if (base64DecodedLen < 10) {
			return .SAML_DECODE_ERROR_BASE64DECODE;
		}

		// If the first 5 chars are "<?xml" or "<saml", no need to inflate
		if ((base64DecodedText[0] == '<')  && (base64DecodedText[3] == 'm') && (base64DecodedText[4] == 'l')) {
			dest[0 .. base64DecodedLen] = base64DecodedText[0 .. base64DecodedLen];

			return base64DecodedLen;
		}

		// Inflate the Base64 decoded text
		char[] inflatedText = new char[.SAML_MESSAGE_MAX_SIZE];
		uint inflatedTextLen = 0;

		npp_mimetools.tinflate.tinf_init();
		int inflateReturnCode = npp_mimetools.tinflate.tinf_uncompress(inflatedText, inflatedTextLen, base64DecodedText);

		if (inflateReturnCode != npp_mimetools.tinflate.TINF_OK) {
			return .SAML_DECODE_ERROR_INFLATE;
		}

		dest[0 .. inflatedTextLen] = inflatedText[0 .. inflatedTextLen];

		// If the first 5 chars are not "<?xml" or "<saml", there's a problem
		if (!((dest[0] == '<') && (dest[3] == 'm') && (dest[4] == 'l'))) {
			return .SAML_DECODE_ERROR_INFLATE;
		}

		return inflatedTextLen;
	}
