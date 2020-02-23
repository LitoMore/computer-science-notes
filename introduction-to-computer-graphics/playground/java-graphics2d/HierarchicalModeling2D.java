
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.awt.geom.*;

public class HierarchicalModeling2D extends JPanel {

   public static void main(String[] args) {
      JFrame window = new JFrame("Hierarchical Modeling in 2D");
      window.setContentPane( new HierarchicalModeling2D() );
      window.pack();
      window.setLocation(100,60);
      window.setResizable(false);
      window.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
      window.setVisible(true);
   }
   
   private int frameNumber; // For animation, increases by 1 in each frame.
   
   private Path2D ground; // A path used for drawing the ground, with "hills".
   private Path2D windmillVane; // A path used for drawing one windmill blade.
   
   private float pixelSize;  // The size of a pixel in drawing coordinates.

   private double xleftRequested = 0;      // horizontal and vertical limits in the
   private double xrightRequested = 7;     //   coordinate system applied to the
   private double ytopRequested = 4;       //   drawgin area.
   private double ybottomRequested = -1;

   public HierarchicalModeling2D() {
      setPreferredSize( new Dimension(700,500));
      setBackground( Color.LIGHT_GRAY );
      setBorder(BorderFactory.createLineBorder(Color.DARK_GRAY, 2));
      ground = new Path2D.Float();
      ground.moveTo(0,-1);
      ground.lineTo(0,0.8F);
      ground.lineTo(1.5F,1.65F);
      ground.lineTo(1.8F,1.3F);
      ground.lineTo(3,2.1F);
      ground.lineTo(4.7F,0.7);
      ground.lineTo(6.1F,1.2);
      ground.lineTo(7,0.8F);
      ground.lineTo(7,-1);
      ground.closePath();
      windmillVane = new Path2D.Float();
      windmillVane.moveTo(0,0);
      windmillVane.lineTo(0.5F,0.1F);
      windmillVane.lineTo(1.5F,0);
      windmillVane.lineTo(0.5F,-0.1F);
      windmillVane.closePath();
      new Timer(30,new ActionListener() {
         public void actionPerformed(ActionEvent evt) {
            frameNumber++;
            repaint();
         }
      }).start();
   }

   protected void paintComponent(Graphics g) {
      super.paintComponent(g);
      Graphics2D g2 = (Graphics2D)g.create();
      g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

      applyLimits(g2, xleftRequested, xrightRequested, ytopRequested, ybottomRequested, false);
      
      g2.setColor( new Color(200,200,255) );
      g2.fillRect(0,0,7,4);  // fills the sky, behind the hills
      g2.setColor( new Color(0,150,30) );
      g2.fill(ground);  // the ground
      g2.setColor(new Color(100,100,150));
      g2.fill(new Rectangle2D.Double(0,-0.4,7,0.8));  // the road
      g2.setStroke( new BasicStroke(5*pixelSize) );
      g2.setColor(Color.WHITE);
      g2.drawLine(0,0,7,0); // the stripe on the road, drawn as a thick line
      g2.setStroke( new BasicStroke(pixelSize) );
      
      AffineTransform saveTr = g2.getTransform();
      
      g2.translate(5.5,3.3);
      drawSun(g2);
      g2.setTransform(saveTr);
      
      g2.translate(0.75,1);
      g2.scale(0.6,0.6);
      drawWindmill(g2);
      g2.setTransform(saveTr);

      g2.translate(2.2,1.3);
      g2.scale(0.4,0.4);
      drawWindmill(g2);
      g2.setTransform(saveTr);

      g2.translate(3.7,0.8);
      g2.scale(0.7,0.7);
      drawWindmill(g2);
      g2.setTransform(saveTr);
      
      g2.translate(-3 + 13*(frameNumber % 300) / 300.0, 0);
      g2.scale(0.3,0.3);
      drawCart(g2);
   }

   private void applyLimits(Graphics2D g2, double xleft, double xright, double ytop, double ybottom, boolean preserveAspect) {
      int width = getWidth();   // The width of this drawing area, in pixels.
      int height = getHeight(); // The height of this drawing area, in pixels.
      if (preserveAspect) {
            // Adjust the limits to match the aspect ratio of the drawing area.
         double displayAspect = Math.abs((double)height / width);
         double requestedAspect = Math.abs(( ybottom-ytop ) / ( xright-xleft ));
         if (displayAspect > requestedAspect) {
            double excess = (ybottom-ytop) * (displayAspect/requestedAspect - 1);
            ybottom += excess/2;
            ytop -= excess/2;
         }
         else if (displayAspect < requestedAspect) {
            double excess = (xright-xleft) * (requestedAspect/displayAspect - 1);
            xright += excess/2;
            xleft -= excess/2;
         }
      }
      double pixelWidth = Math.abs(( xright - xleft ) / width);
      double pixelHeight = Math.abs(( ybottom - ytop ) / height);
      pixelSize = (float)Math.min(pixelWidth,pixelHeight);
      g2.scale( width / (xright-xleft), height / (ybottom-ytop) );
      g2.translate( -xleft, -ytop );
   }

   private void drawSun(Graphics2D g2) {
      g2.rotate(-frameNumber/30.0);
      g2.setColor( new Color(0xDD8800) );
      for (int i = 0; i < 13; i++) { // Draw 13 rays, with different rotations.
         g2.rotate( 2*Math.PI / 13 ); // Note that the rotations accumulate!
         g2.draw( new Line2D.Double(0,0,0.75,0) );  // This line is subjected to a rotation!
      }
      g2.setColor(Color.YELLOW);
      g2.fill( new Ellipse2D.Double(-0.5,-0.5,1,1) );  // The sun itself.
      g2.setColor( new Color(0xDD8800) );
      g2.draw( new Ellipse2D.Double(-0.5,-0.5,1,1) );
   }
   
   private void drawWindmill(Graphics2D g2) {
      g2.setColor(new Color(225,200,200));
      g2.fill(new Rectangle2D.Double(-0.05,0,0.1,3));
      g2.translate(0,3);  // Translations to move the vanes to the top of the pole.
      g2.rotate(frameNumber/23.0); // Apply an overall rotation to the set of 3 vanes.
      g2.setColor(new Color(0xAA9999));
      for (int i = 0; i < 3; i++) {
         g2.rotate(2*Math.PI/3);  // Note: these rotations accumulate!
         g2.fill(windmillVane);   // Vane is subject to a rotation!
      }
   }
   
   private void drawCart(Graphics2D g2) {
      AffineTransform tr = g2.getTransform();  // save the current transform
      g2.translate(-1.5,-0.1);  // center of first wheel will be at (-1.65,-0.1)
      g2.scale(0.8,0.8);
      drawWheel(g2);
      g2.setTransform(tr);  // restore the transform 
      g2.translate(1.5,-0.1);  // center of second wheel will be at (1.65,-0.1)
      g2.scale(0.8,0.8);
      drawWheel(g2);
      g2.setTransform(tr);  // restore the transform
      g2.setColor(Color.RED);
      g2.fill(new Rectangle2D.Double(-3,0,6,2) ); // draw the body of the cart
      g2.fill(new Rectangle2D.Double(-2.3,1,2.6,1) ); // draw the top of the cart
   }
   
   private void drawWheel(Graphics2D g2) {
      g2.setColor(Color.BLACK);
      g2.fill( new Ellipse2D.Double(-1,-1,2,2) );
      g2.setColor(Color.LIGHT_GRAY);
      g2.fill( new Ellipse2D.Double(-0.8,-0.8,1.6,1.6) );
      g2.setColor(Color.BLACK);
      g2.fill( new Ellipse2D.Double(-0.2,-0.2,0.4,0.4) );
      g2.rotate( -frameNumber/30.0 );
      for (int i = 0; i < 15; i++) {  // draw 15 spokes
         g2.rotate(2*Math.PI/15);
         g2.draw( new Rectangle2D.Double(0,-0.1,1,0.2) );
      }
   }

   
}
