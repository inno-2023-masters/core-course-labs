import {app} from '../app';
import request from 'supertest';

describe("GET /", () => {
  it("Should return joke", async () => {
    const res = await request(app).get("/");
    expect(res.statusCode).toBe(200);
    expect(res.text.length).toBeGreaterThan(0);
  });
});