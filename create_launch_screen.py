#!/usr/bin/env python3
"""
Create launch screen image for PoP iOS app.
Clean, centered logo on brand background.
"""

from PIL import Image, ImageDraw
import math
import os

# Brand colors
BLUE_BG = (26, 123, 168)      # #1A7BA8 - Primary Blue
GOLD = (232, 168, 50)          # #E8A832 - Accent Gold
WHITE = (255, 255, 255)

def create_sun_rays(draw, center_x, center_y, inner_radius, outer_radius, num_rays, color):
    """Draw sun rays emanating from center."""
    for i in range(num_rays):
        angle = (2 * math.pi * i) / num_rays
        for j in range(3):
            offset_angle = angle + (j - 1) * 0.03
            x1 = center_x + inner_radius * math.cos(offset_angle)
            y1 = center_y + inner_radius * math.sin(offset_angle)
            x2 = center_x + outer_radius * math.cos(offset_angle)
            y2 = center_y + outer_radius * math.sin(offset_angle)
            draw.line([(x1, y1), (x2, y2)], fill=color, width=max(3, int(inner_radius * 0.025)))

def draw_buffalo_silhouette(draw, center_x, center_y, size, color):
    """Draw a simplified buffalo/bison silhouette."""
    body_width = size * 0.8
    body_height = size * 0.5
    body_left = center_x - body_width/2
    body_top = center_y - body_height/2 + size * 0.05

    draw.ellipse([body_left, body_top, body_left + body_width, body_top + body_height], fill=color)

    head_size = size * 0.35
    head_x = center_x - body_width/2 - head_size * 0.1
    head_y = center_y - head_size * 0.2
    draw.ellipse([head_x, head_y, head_x + head_size, head_y + head_size], fill=color)

    hump_points = [
        (center_x - body_width * 0.2, body_top),
        (center_x - body_width * 0.1, body_top - size * 0.15),
        (center_x + body_width * 0.1, body_top - size * 0.12),
        (center_x + body_width * 0.2, body_top),
    ]
    draw.polygon(hump_points, fill=color)

    leg_width = size * 0.08
    leg_height = size * 0.25
    leg_y = body_top + body_height - size * 0.05

    for x_offset in [-0.25, -0.1, 0.15, 0.3]:
        draw.rectangle([
            center_x + body_width * x_offset - leg_width/2, leg_y,
            center_x + body_width * x_offset + leg_width/2, leg_y + leg_height
        ], fill=color)

    tail_start = (center_x + body_width * 0.35, center_y + body_height * 0.1)
    tail_end = (center_x + body_width * 0.45, center_y + body_height * 0.3)
    draw.line([tail_start, tail_end], fill=color, width=int(size * 0.04))

    horn_x = head_x + head_size * 0.6
    horn_y = head_y + head_size * 0.1
    draw.polygon([
        (horn_x, horn_y + head_size * 0.2),
        (horn_x + size * 0.08, horn_y - size * 0.05),
        (horn_x + size * 0.12, horn_y + head_size * 0.15),
    ], fill=color)

def create_launch_logo(size, output_path):
    """Create a transparent logo for launch screen."""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)

    center = size // 2
    sun_radius = int(size * 0.32)
    sun_outer_radius = int(size * 0.42)
    buffalo_size = int(size * 0.45)

    # Draw sun rays
    create_sun_rays(draw, center, center, sun_radius - 10, sun_outer_radius, 32, GOLD + (255,))

    # Draw sun circle
    draw.ellipse([
        center - sun_radius, center - sun_radius,
        center + sun_radius, center + sun_radius
    ], fill=GOLD + (255,))

    # Draw buffalo
    draw_buffalo_silhouette(draw, center, center + int(size * 0.02), buffalo_size, WHITE + (255,))

    img.save(output_path, 'PNG')
    print(f"Created: {output_path}")

if __name__ == "__main__":
    # Create LaunchLogo imageset directory
    output_dir = "/Users/rorystone/Documents/PoPClaude/PoP/PoP/Assets.xcassets/LaunchLogo.imageset"
    os.makedirs(output_dir, exist_ok=True)

    # Create logo images at different scales
    create_launch_logo(300, os.path.join(output_dir, "LaunchLogo.png"))
    create_launch_logo(600, os.path.join(output_dir, "LaunchLogo@2x.png"))
    create_launch_logo(900, os.path.join(output_dir, "LaunchLogo@3x.png"))

    # Create Contents.json
    contents = '''{
  "images" : [
    {
      "filename" : "LaunchLogo.png",
      "idiom" : "universal",
      "scale" : "1x"
    },
    {
      "filename" : "LaunchLogo@2x.png",
      "idiom" : "universal",
      "scale" : "2x"
    },
    {
      "filename" : "LaunchLogo@3x.png",
      "idiom" : "universal",
      "scale" : "3x"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}'''

    with open(os.path.join(output_dir, "Contents.json"), 'w') as f:
        f.write(contents)

    print("\nLaunch logo created successfully!")
