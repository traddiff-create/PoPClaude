#!/usr/bin/env python3
"""
Create app icon for PoP (People Over Party) iOS app.
Uses the buffalo/sun motif from the Better Together logo.
"""

from PIL import Image, ImageDraw
import math
import os

# Brand colors
BLUE_BG = (26, 123, 168)      # #1A7BA8 - Primary Blue
GOLD = (232, 168, 50)          # #E8A832 - Accent Gold
WHITE = (255, 255, 255)
DARK_BG = (13, 61, 84)         # #0D3D54 - Dark Background

def create_sun_rays(draw, center_x, center_y, inner_radius, outer_radius, num_rays, color):
    """Draw sun rays emanating from center."""
    for i in range(num_rays):
        angle = (2 * math.pi * i) / num_rays
        # Create wavy/flame-like rays
        for j in range(3):
            offset_angle = angle + (j - 1) * 0.03
            x1 = center_x + inner_radius * math.cos(offset_angle)
            y1 = center_y + inner_radius * math.sin(offset_angle)
            x2 = center_x + outer_radius * math.cos(offset_angle)
            y2 = center_y + outer_radius * math.sin(offset_angle)
            draw.line([(x1, y1), (x2, y2)], fill=color, width=8)

def draw_buffalo_silhouette(draw, center_x, center_y, size, color):
    """Draw a simplified buffalo/bison silhouette."""
    # Buffalo body - main oval
    body_width = size * 0.8
    body_height = size * 0.5
    body_left = center_x - body_width/2
    body_top = center_y - body_height/2 + size * 0.05

    # Draw body (ellipse)
    draw.ellipse([
        body_left, body_top,
        body_left + body_width, body_top + body_height
    ], fill=color)

    # Head - smaller circle on left side
    head_size = size * 0.35
    head_x = center_x - body_width/2 - head_size * 0.1
    head_y = center_y - head_size * 0.2
    draw.ellipse([
        head_x, head_y,
        head_x + head_size, head_y + head_size
    ], fill=color)

    # Hump - raised area on back
    hump_points = [
        (center_x - body_width * 0.2, body_top),
        (center_x - body_width * 0.1, body_top - size * 0.15),
        (center_x + body_width * 0.1, body_top - size * 0.12),
        (center_x + body_width * 0.2, body_top),
    ]
    draw.polygon(hump_points, fill=color)

    # Legs - four rectangles
    leg_width = size * 0.08
    leg_height = size * 0.25
    leg_y = body_top + body_height - size * 0.05

    # Front legs
    draw.rectangle([
        center_x - body_width * 0.25 - leg_width/2, leg_y,
        center_x - body_width * 0.25 + leg_width/2, leg_y + leg_height
    ], fill=color)
    draw.rectangle([
        center_x - body_width * 0.1 - leg_width/2, leg_y,
        center_x - body_width * 0.1 + leg_width/2, leg_y + leg_height
    ], fill=color)

    # Back legs
    draw.rectangle([
        center_x + body_width * 0.15 - leg_width/2, leg_y,
        center_x + body_width * 0.15 + leg_width/2, leg_y + leg_height
    ], fill=color)
    draw.rectangle([
        center_x + body_width * 0.3 - leg_width/2, leg_y,
        center_x + body_width * 0.3 + leg_width/2, leg_y + leg_height
    ], fill=color)

    # Tail
    tail_start = (center_x + body_width * 0.35, center_y + body_height * 0.1)
    tail_end = (center_x + body_width * 0.45, center_y + body_height * 0.3)
    draw.line([tail_start, tail_end], fill=color, width=int(size * 0.04))

    # Horn on head
    horn_x = head_x + head_size * 0.6
    horn_y = head_y + head_size * 0.1
    draw.polygon([
        (horn_x, horn_y + head_size * 0.2),
        (horn_x + size * 0.08, horn_y - size * 0.05),
        (horn_x + size * 0.12, horn_y + head_size * 0.15),
    ], fill=color)

def create_app_icon(size=1024, output_path="AppIcon.png", dark_mode=False):
    """Create the main app icon."""
    # Create image with background
    bg_color = DARK_BG if dark_mode else BLUE_BG
    img = Image.new('RGB', (size, size), bg_color)
    draw = ImageDraw.Draw(img)

    center = size // 2

    # Sun circle (gold)
    sun_radius = int(size * 0.32)
    sun_outer_radius = int(size * 0.42)

    # Draw sun rays first (behind the circle)
    create_sun_rays(draw, center, center, sun_radius - 10, sun_outer_radius, 32, GOLD)

    # Draw sun circle
    draw.ellipse([
        center - sun_radius, center - sun_radius,
        center + sun_radius, center + sun_radius
    ], fill=GOLD)

    # Draw buffalo silhouette in white
    buffalo_size = int(size * 0.45)
    draw_buffalo_silhouette(draw, center, center + int(size * 0.02), buffalo_size, WHITE)

    img.save(output_path, 'PNG')
    print(f"Created: {output_path}")
    return img

def create_tinted_icon(size=1024, output_path="AppIcon-tinted.png"):
    """Create tinted version (monochrome for iOS tinted icon)."""
    img = Image.new('RGB', (size, size), (128, 128, 128))
    draw = ImageDraw.Draw(img)

    center = size // 2
    sun_radius = int(size * 0.32)
    sun_outer_radius = int(size * 0.42)

    # Draw in white for tinted mode
    create_sun_rays(draw, center, center, sun_radius - 10, sun_outer_radius, 32, WHITE)
    draw.ellipse([
        center - sun_radius, center - sun_radius,
        center + sun_radius, center + sun_radius
    ], fill=WHITE)

    # Buffalo in darker shade
    buffalo_size = int(size * 0.45)
    draw_buffalo_silhouette(draw, center, center + int(size * 0.02), buffalo_size, (100, 100, 100))

    img.save(output_path, 'PNG')
    print(f"Created: {output_path}")

if __name__ == "__main__":
    output_dir = "/Users/rorystone/Documents/PoPClaude/PoP/PoP/Assets.xcassets/AppIcon.appiconset"

    # Create main icon (1024x1024)
    create_app_icon(1024, os.path.join(output_dir, "AppIcon.png"))

    # Create dark mode variant
    create_app_icon(1024, os.path.join(output_dir, "AppIcon-dark.png"), dark_mode=True)

    # Create tinted variant
    create_tinted_icon(1024, os.path.join(output_dir, "AppIcon-tinted.png"))

    print("\nAll icons created successfully!")
