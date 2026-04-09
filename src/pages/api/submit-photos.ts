import type { APIRoute } from "astro";

export const POST: APIRoute = async ({ request }) => {
  try {
    const body = await request.json();

    // Stub — backend not wired yet
    // When tesseract is ready, forward to:
    // http://<tesseract-ip>:8000/api/submit-photos
    console.log("[submit-photos] Received submission:", {
      bookingId: body.bookingId,
      skipped: body.skipped,
      photoCount: body.photos?.length ?? 0,
    });

    return new Response(JSON.stringify({ ok: true }), {
      status: 200,
      headers: { "Content-Type": "application/json" },
    });
  } catch (err) {
    return new Response(JSON.stringify({ ok: false, error: "Invalid request" }), {
      status: 400,
      headers: { "Content-Type": "application/json" },
    });
  }
};
