package com.bsb.cms.controller.upload;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;

/**
 * @author hongjian.liu
 * @version 1.0.0 2014-10-9
 * @since 1.0
 */
public class ImageUtil {
	/**
	 * 压缩图片并且获得图片的大小
	 * 
	 * @param src
	 *            输入流
	 * @param dist
	 *            输出文件路径
	 * @param width
	 * @param height
	 * @return
	 */
	public static long createThumbnail(InputStream src, String dist,
			float width, float height) {
		try {

			int newWidth = 0;
			int newHeight = 0;
			BufferedImage image = ImageIO.read(src);
			// 获得缩放的比例
			double ratio = 1.0;
			// 判断如果高、宽都不大于设定值，则不处理
			if (image.getHeight() > height || image.getWidth() > width) {
				if (image.getHeight() > image.getWidth()) {
					ratio = height / image.getHeight();
				} else {
					ratio = width / image.getWidth();
				}
			}
			// 计算新的图面宽度和高度
			newWidth = (int) (image.getWidth() * ratio);
			newHeight = (int) (image.getHeight() * ratio);
			BufferedImage bfImage = new BufferedImage(newWidth, newHeight,
					BufferedImage.TYPE_INT_RGB);
			bfImage.getGraphics().drawImage(
					image.getScaledInstance(newWidth, newHeight,
							Image.SCALE_SMOOTH), 0, 0, null);

			FileOutputStream os = new FileOutputStream(dist);
			com.sun.image.codec.jpeg.JPEGImageEncoder encoder = com.sun.image.codec.jpeg.JPEGCodec
					.createJPEGEncoder(os);
			encoder.encode(bfImage);
			os.flush();
			os.close();
			return getImageSize(dist);
		} catch (Exception e) {
			System.out.println("创建缩略图发生异常" + e.getMessage());
			return 0l;
		}
	}

	/**
	 * 获得某个问价路径文件大小
	 * 
	 * @param fullPath
	 * @return
	 */
	public static long getImageSize(String fullPath) {
		BufferedInputStream bis = null;
		File file = null;
		try {
			file = new File(fullPath);
			bis = new BufferedInputStream(new FileInputStream(file));
			return bis.available();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return 0;
		} catch (IOException e) {

			e.printStackTrace();
			return 0;
		} finally {
			if (bis != null)
				try {
					bis.close();
				} catch (IOException e) {

					e.printStackTrace();
				}
			file = null;
			bis = null;
		}
	}

	/**
	 * 获得图片长度和高度
	 * 
	 * @param file
	 * @return
	 */
	public static int[] getFileWidthAndHeight(InputStream file) {
		int[] arr = new int[2];
		try {
			BufferedImage Bi = ImageIO.read(file);
			arr[0] = Bi.getWidth();
			arr[1] = Bi.getHeight();
		} catch (IOException e) {
			e.printStackTrace();
			arr[0] = 0;
			arr[1] = 0;
			return arr;
		}
		return arr;
	}

	/**
	 * 压缩像素
	 * 
	 * @param quality
	 *            0-1
	 * @param fullPath
	 *            图片路径
	 */
	public static void compressImage(int width, int height, float quality,
			String fullPath) {
		BufferedImage image = null;
		int newWidth = 0;
		int newHeight = 0;
		try {
			image = ImageIO.read(new FileInputStream(fullPath));
			// 获得缩放的比例
			double ratio = 1.0;
			// 判断如果高、宽都不大于设定值，则不处理
			if (image.getHeight() > height || image.getWidth() > width) {
				if (image.getHeight() > image.getWidth()) {
					ratio = height / image.getHeight();
				} else {
					ratio = width / image.getWidth();
				}
			}
			// 计算新的图面宽度和高度
			newWidth = (int) (image.getWidth() * ratio);
			newHeight = (int) (image.getHeight() * ratio);
			BufferedImage bfImage = new BufferedImage(newWidth, newHeight,
					BufferedImage.TYPE_INT_RGB);
			bfImage.getGraphics().drawImage(
					image.getScaledInstance(image.getWidth(),
							image.getHeight(), Image.SCALE_SMOOTH), 0, 0, null);
			FileOutputStream os = new FileOutputStream(fullPath);
			com.sun.image.codec.jpeg.JPEGImageEncoder encoder = com.sun.image.codec.jpeg.JPEGCodec
					.createJPEGEncoder(os);
			com.sun.image.codec.jpeg.JPEGEncodeParam jpeg = encoder
					.getDefaultJPEGEncodeParam(bfImage);
			jpeg.setQuality(quality, false);
			encoder.setJPEGEncodeParam(jpeg);
			encoder.encode(bfImage);
			os.flush();
			os.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 读取远程url图片
	public static String returnImg(String imgurl, String path) {
		boolean b = false;
		OutputStream bos = null;
		java.io.BufferedInputStream bis = null;
		String dir = getNewDynamicPath();
		String imgUri = dir + "/" +getNewName(imgurl);
		String allPath = path + imgUri;
		File f = new File(path + dir);
		if(!f.exists()){
			f.mkdirs();
		}
		try {
			// 实例化url
			URL url = new URL(imgurl);
			// 载入图片到输入流
			bis = new BufferedInputStream(url.openStream());
			// 实例化存储字节数组
			byte[] bytes = new byte[100];
			// 设置写入路径以及图片名称
			bos = new FileOutputStream(new File(allPath));
			int len;
			while ((len = bis.read(bytes)) > 0) {
				bos.write(bytes, 0, len);
			}
			bis.close();
			bos.flush();
			bos.close();
			// 关闭输出流
			b = true;
		} catch (Exception e) {
			// 如果图片未找到
			b = false;
		} finally {
			try {
				if (bis != null)

					bis.close();

				if (bos != null)
					bos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		//int[] a = new int[2];
		if (b) {/*// 图片存在
				// 得到文件
			java.io.File file = new java.io.File(allPath);
			BufferedImage bi = null;
			boolean imgwrong = false;
			try {
				// 读取图片
				bi = javax.imageio.ImageIO.read(file);
				try {
					// 判断文件图片是否能正常显示,有些图片编码不正确
					int i = bi.getType();
					imgwrong = true;
				} catch (Exception e) {
					imgwrong = false;
				}
			} catch (IOException ex) {
				ex.printStackTrace();
			}
			if (imgwrong) {
				a[0] = bi.getWidth(); // 获得 宽度
				a[1] = bi.getHeight(); // 获得 高度
			} else {
				a = null;
			}
			// 删除文件
			//file.delete();
*/		} else {// 图片不存在
			//a = null;
	      imgUri=null;
		}
		
		return imgUri;
	}
	
	/**
	 * 動態獲得文件的路徑
	 * 
	 * @param fileName
	 * @return
	 */
	private static String getNewName(String fileName) {
		String newPath = String.valueOf(System.currentTimeMillis())
				+ fileName.substring(fileName.lastIndexOf("."));
		return newPath;
	}

	private static String getNewDynamicPath() {
		DateFormat df = new SimpleDateFormat("yyyy-MM");
		return df.format(new Date());
	}


}
