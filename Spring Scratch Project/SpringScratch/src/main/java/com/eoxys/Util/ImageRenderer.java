package com.eoxys.Util;

/* ===============================================================================
 :  *
 3:  * Part of the InfoGlue Content Management Platform (www.infoglue.org)
 :  *
 5:  * ===============================================================================
 6:  *
 7:  *  Copyright (C)
 8:  * 
 9:  * This program is free software; you can redistribute it and/or modify it under
 10:  * the terms of the GNU General Public License version , as published by the
 11:  * Free Software Foundation. See the file LICENSE.html for more information.
 1:  * 
 13:  * This program is distributed in the hope that it will be useful, but WITHOUT
 14:  * ANY WARRANTY, including the implied warranty of MERCHANTABILITY or FITNESS
 15:  * FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 16:  * 
 17:  * You should have received a copy of the GNU General Public License along with
 18:  * this program; if not, write to the Free Software Foundation, Inc. / 59 Temple
 19:  * Place, Suite 330 / Boston, MA 0111-1307 / USA.
 0:  *
 1:  * ===============================================================================
 :  */

//package org.infoglue.deliver.util.graphics;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.font.TextAttribute;
import java.awt.font.TextLayout;
import java.awt.image.BufferedImage;
import java.io.File;
import java.net.URL;
import java.text.AttributedCharacterIterator;
import java.text.AttributedString;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;
import java.util.Vector;

import javax.imageio.ImageIO;

/**
 * 47: * This class demonstrates how to line-break and draw a paragraph 48: * of
 * text using LineBreakMeasurer and TextLayout. 49: * 50: * This class
 * constructs a LineBreakMeasurer from an 51: * AttributedCharacterIterator. It
 * uses the LineBreakMeasurer 5: * to create and draw TextLayouts (lines of
 * text) which fit within 53: * the Component's width. 54:
 */
@SuppressWarnings({"unused","unchecked","rawtypes"})
public class ImageRenderer // extends JFrame
{
	public static final int ALIGN_LEFT = 0;
	public static final int ALIGN_CENTER = 1;
	public static final int ALIGN_RIGHT = 2;

	private int canvasWidth = 400;
	private int canvasHeight = 250;
	private int textStartPosX = 5;
	private int textStartPosY = 75;
	private int textWidth = 390;
	private int textHeight = 250;

	private String fontName = "Garamond";
	private int fontStyle = Font.BOLD | Font.ITALIC;
	private int fontSize = 25;

	private int alignment = ALIGN_CENTER;
	// private int alignment = ALIGN_LEFT;

	private Color backgroundColor = null;
	private Color foreGroundColor = Color.black;

	private String backgroundImageUrl = null;

	/**
	 * 145: * This method generates a gif-image from the send in string with the
	 * given width/height. 146:
	 */

	public void generateGifImageFromText(String file, String text,
			String encoding) throws Exception {
		BufferedImage image = new BufferedImage(this.canvasWidth,
				this.canvasHeight, BufferedImage.TYPE_INT_ARGB);

		// if(!encoding.equalsIgnoreCase("utf-8"))
		// text = new String(text.getBytes(encoding), "UTF-8");

		drawText((Graphics2D) image.getGraphics(), text);
		Hashtable arguments = new Hashtable();
		arguments.put("encoding", "websafe");
		// logger.info("Going to generate gif to disc...");
		// new GifEncoder().encode(image, new DataOutputStream(new
		// FileOutputStream(file)), arguments);

		File outputFile = new File(file);
		System.out.println("mnb " + outputFile);
		javax.imageio.ImageIO.write(image, "PNG", outputFile);
	}

	private void drawText(Graphics2D gd, String text) throws Exception {
		Font font = new Font(this.fontName, this.fontStyle, this.fontSize);// FontSaver.create(this.fontName,
																			// this.fontStyle,this.fontSize);

		if (this.backgroundImageUrl != null) {
			URL url = new URL(this.backgroundImageUrl);
			BufferedImage bufferedImage = ImageIO.read(url);
			gd.drawImage(bufferedImage, 0, 0, null);
		} else {
			gd.setBackground(this.backgroundColor);
			gd.setPaint(this.backgroundColor);
			gd.fillRect(0, 0, this.canvasWidth, this.canvasHeight);
		}
		gd.setPaint(this.foreGroundColor);
		gd.setFont(font);

		gd.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
				RenderingHints.VALUE_ANTIALIAS_ON);
		gd.setRenderingHint(RenderingHints.KEY_RENDERING,
				RenderingHints.VALUE_RENDER_QUALITY);

		AttributedString as = new AttributedString(text);
		as.addAttribute(TextAttribute.FONT, font);
		as.addAttribute(TextAttribute.JUSTIFICATION, font);
		AttributedCharacterIterator paragraph = as.getIterator();
		int paragraphStart = paragraph.getBeginIndex();
		int paragraphEnd = paragraph.getEndIndex();

		float drawPosY = (float) textStartPosY;

		StringTokenizer st = new StringTokenizer(text);
		Vector v = new Vector();
		while (st.hasMoreElements()) {
			String word = (String) st.nextElement();
			System.out.println(word);
			v.addElement(word);
		}

		String testString = "";
		String realString = "";
		List lines = new ArrayList();
		int offset = 0;
		for (int i = 0; i < v.size(); i++) {
			testString = realString + (String) v.get(i) + " ";
			TextLayout testLay = new TextLayout(testString, font,
					gd.getFontRenderContext());

			if (testLay.getBounds().getWidth() > textWidth || i == v.size() - 2) {
				String remainingString = testString;
				if (v.size() > i + 1)
					remainingString += (String) v.get(i + 1);
				if (v.size() > i + 2)
					remainingString += " " + (String) v.get(i + 2);

				TextLayout fullyFilledLay = new TextLayout(remainingString,
						font, gd.getFontRenderContext());
				if (fullyFilledLay.getBounds().getWidth() < textWidth) {
					realString = testString;
					testString = "";
				} else {
					String row = "";
					for (int j = offset; j < i; j++)
						row = row + (String) v.get(j) + " ";

					lines.add(row);
					realString = "";
					testString = "";
					offset = i;
					realString = (String) v.get(i) + " ";
				}
			} else {
				realString = testString;
				testString = "";
			}
		}

		if (!realString.equalsIgnoreCase(""))
			lines.add(realString);

		Iterator i = lines.iterator();
		while (i.hasNext()) {
			String word = (String) i.next();
			if (word != null && word.length() > 0) {
				TextLayout layout = new TextLayout(word, font,
						gd.getFontRenderContext());

				int centerX = this.textWidth / 2;
				int centeredTextStartX = centerX
						- ((int) layout.getVisibleAdvance() / 2);
//				centeredTextStartX = this.canvasWidth - this.textWidth / 2;
				int rightTextStartX = this.textWidth
						- (int) layout.getVisibleAdvance();
				System.out.println(centeredTextStartX + "," + rightTextStartX
						+ "," + textStartPosX);
				// Move y-coordinate by the ascent of the layout.
				drawPosY += layout.getAscent();

				float drawPosX;

				if (layout.isLeftToRight()) {

					if (this.alignment == ALIGN_CENTER)
						drawPosX = centeredTextStartX;
					else if (this.alignment == ALIGN_RIGHT)
						drawPosX = rightTextStartX - textStartPosX;
					else
						drawPosX = textStartPosX;
				} else {
					drawPosX = textWidth - layout.getAdvance();
				}
				System.out.println(drawPosX + "," + drawPosY);

				// Draw the TextLayout at (drawPosX, drawPosY).
				layout.draw(gd, drawPosX, drawPosY);

				// Move y-coordinate in preparation for next layout.
				drawPosY += layout.getDescent() + layout.getLeading();
			}
		}

	}

	public void setCanvasHeight(int canvasHeight) {
		this.canvasHeight = canvasHeight;
	}

	public void setCanvasWidth(int canvasWidth) {
		this.canvasWidth = canvasWidth;
	}

	public void setTextHeight(int textHeight) {
		this.textHeight = textHeight;
	}

	public void setTextStartPosX(int textStartPosX) {
		this.textStartPosX = textStartPosX;
	}

	public void setTextStartPosY(int textStartPosY) {
		this.textStartPosY = textStartPosY;
	}

	public void setTextWidth(int textWidth) {
		this.textWidth = textWidth;
	}

	public void setBackgroundColor(Color backgroundColor) {
		this.backgroundColor = backgroundColor;
	}

	public void setForeGroundColor(Color foreGroundColor) {
		this.foreGroundColor = foreGroundColor;
	}

	public void setFontName(String fontName) {
		this.fontName = fontName;
	}

	public void setFontSize(int fontSize) {
		this.fontSize = fontSize;
	}

	public void setFontStyle(int fontStyle) {
		this.fontStyle = fontStyle;
	}

	public void setBackgroundImageUrl(String backgroundImageUrl) {
		this.backgroundImageUrl = backgroundImageUrl;
	}

	public int getAlignment() {
		return alignment;
	}

	public void setAlignment(int alignment) {
		this.alignment = alignment;
	}

}
